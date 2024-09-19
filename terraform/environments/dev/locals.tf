locals {
  region                = "ap-south-1"
  az1                   = "ap-south-1a"
  az2                   = "ap-south-1b"
  vpc_name              = "dev-main"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet1_cidr   = "10.0.64.0/19"
  public_subnet2_cidr   = "10.0.96.0/19"
  cluster_name          = "dev-cluster"
  cluster_version       = "1.30" # or your preferred EKS version
  instance_types        = ["t2.medium"]
  node_group_name       = "general"
  kubernetes_group_name = ["my-admin"]
  admin_user_name       = "manager"
}

