locals {
  region                = "ap-south-2"
  vpc_name              = "dev-main"
  vpc_cidr              = "10.0.0.0/16"
  private_subnet1_cidr  = "10.0.0.0/19"
  private_subnet2_cidr  = "10.0.32.0/19"
  public_subnet1_cidr   = "10.0.64.0/19"
  public_subnet2_cidr   = "10.0.96.0/19"
  cluster_name          = "dev-cluster"
  igw_cidr              = "0.0.0.0/0"
  nat_cidr              = "0.0.0.0/0"
  environment           = "dev"
  cluster_version       = "1.31" # or your preferred EKS version
  instance_types        = ["t3.medium"]
  node_group_name       = "dev-cluster-general"
  capacity_type         = "SPOT"
  addon_name            = "eks-pod-identity-agent"
  addon_version         = "v1.3.0-eksbuild.1"
  dev_user_name         = "developer"
  k8s_dev_groups_name   = ["my-viewer"]
  admin_user_name       = "manager"
  kubernetes_group_name = ["my-admin"]
}



