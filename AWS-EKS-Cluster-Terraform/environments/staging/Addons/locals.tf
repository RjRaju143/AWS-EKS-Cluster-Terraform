locals {
  region                    = "ap-south-1"
  cluster_name              = "staging-cluster"
  addon_name                = "eks-pod-identity-agent"
  addon_version             = "v1.3.0-eksbuild.1"
  dev_user_name             = "developer"
  dev_groups_name           = ["my-viewer"]
  admin_user_name           = "manager"
  kubernetes_group_name     = ["admin"]
  manager_iam_role_name     = "eks-admin"
  openid_connect_provider   = "https://oidc.eks.ap-south-1.amazonaws.com/id/642A8A5B3D6DE5C68D0563ABE6AB50BF" # Change this to your EKS openid connect provider
  cluster_security_group_id = ["sg-01da4f6feba3bf27b"]                                                        # Change this to your EKS security group id
  subnet_id_1               = "subnet-0bc431a9a0bb2943c"                                                      # Change this to your subnet id
  subnet_id_2               = "subnet-096aeb1d6c4497f01"                                                      # Change this to your subnet id
  vpc_id                    = "vpc-0c0ae81b97d3b1a75"                                                         # Change the VPC ID
}
