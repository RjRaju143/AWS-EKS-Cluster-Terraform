locals {
  region                  = "ap-south-1"
  cluster_name            = "staging-cluster"
  addon_name              = "eks-pod-identity-agent"
  addon_version           = "v1.3.0-eksbuild.1"
  dev_user_name           = "developer"
  dev_groups_name         = ["my-viewer"]
  admin_user_name         = "manager"
  kubernetes_group_name   = ["admin"]
  manager_iam_role_name   = "eks-admin"
  openid_connect_provider = "https://oidc.eks.ap-south-1.amazonaws.com/id/C045E67F62586EF5BD99AC8A09D558AA" # Change this to your EKS openid connect provider

  cluster_security_group_id = ["sg-08d96ab5aaed11fcd"]   # Change this to your EKS security group id
  subnet_id_1               = "subnet-0e9a450cec6606fdf" # Change this to your subnet id
  subnet_id_2               = "subnet-0b396881398efc750" # Change this to your subnet id

  vpc_id = "vpc-0df1e131371b6a6e8" # Change the VPC ID
}
