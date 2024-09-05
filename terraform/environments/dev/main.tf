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

module "vpc" {
  source = "../../modules/0-vpc"

  cidr_block          = "10.0.0.0/16"
  name                = "dev-main"
  public_subnet1_cidr = "10.0.64.0/19"
  public_subnet2_cidr = "10.0.96.0/19"
  zone1               = "ap-south-1a"
  zone2               = "ap-south-1b"
  cluster_name        = "dev-cluster"
}

module "eks" {
  source = "../../modules/1-eks"

  name           = "dev-cluster"
  eksversion     = "1.30" # or your preferred EKS version
  subnet_ids     = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]
  instance_types = ["t2.small"]
  desired_size   = 1
  max_size       = 3
  min_size       = 1
}

module "dev_user" {
  source            = "../../modules/2-dev-user"
  user_name         = "developer"
  cluster_name      = "dev-cluster"
  kubernetes_groups = ["dev-user"]
}
