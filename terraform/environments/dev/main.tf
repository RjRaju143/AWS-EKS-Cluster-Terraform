provider "aws" {
  region = "ap-south-1" # or your preferred region
}

terraform {
  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
}

locals {
  vpc_name            = "dev-main"
  vpc_cidr            = "10.0.0.0/16"
  az1                 = "ap-south-1a"
  az2                 = "ap-south-1b"
  public_subnet1_cidr = "10.0.64.0/19"
  public_subnet2_cidr = "10.0.96.0/19"
  cluster_name        = "dev-cluster"
  cluster_version     = "1.30" # or your preferred EKS version
  instance_types      = ["t2.small"]
  admin_iam_user_name = "manager"
  kubernetes_groups   = ["my-admin"]
}

module "vpc" {
  source = "../../modules/0-vpc"

  name                = local.vpc_name
  cidr_block          = local.vpc_cidr
  public_subnet1_cidr = local.public_subnet1_cidr
  public_subnet2_cidr = local.public_subnet2_cidr
  zone1               = local.az1
  zone2               = local.az2
  cluster_name        = local.cluster_name
}

module "eks" {
  source = "../../modules/1-eks"

  name           = local.cluster_name
  eksversion     = local.cluster_version
  subnet_ids     = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]
  instance_types = local.instance_types
  public_zone1   = module.vpc.public_subnet1_id
  public_zone2   = module.vpc.public_subnet2_id
  desired_size   = 1
  max_size       = 3
  min_size       = 1
}

module "ebs-csi" {
  source = "../../modules/2-ebs-csi"

  cluster_name = local.cluster_name
}

module "admin-user" {
  source = "../../modules/4-admin-user"

  cluster_name        = local.cluster_name
  eks_admin           = "${local.cluster_name}-eks_admin"
  admin_iam_user_name = local.admin_iam_user_name
  kubernetes_groups   = local.kubernetes_groups
}
