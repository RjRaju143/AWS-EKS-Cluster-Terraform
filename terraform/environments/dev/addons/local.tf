locals {
  ### Addons
  region                    = "ap-south-1"
  cluster_name              = "dev-cluster"
  addon_name                = "eks-pod-identity-agent"
  addon_version             = "v1.3.0-eksbuild.1"
  openid_connect_provider   = "https://oidc.eks.ap-south-1.amazonaws.com/id/64238A1307A50757AE90D720DEFF138B" # Change this to your EKS openid connect provider
  dev_user_name             = "developer"
  dev_groups_name           = ["my-viewer"]
  admin_user_name           = "manager"
  kubernetes_group_name     = ["admin"]
  manager_iam_role_name     = "eks-admin"
  cluster_security_group_id = ["sg-006ff62f665814906"]   # Change this to your EKS security group id
  subnet_id_1               = "subnet-0be2bdf80f0160ebe" # Change this to your subnet id
  subnet_id_2               = "subnet-09eb61889cfbf1887" # Change this to your subnet id
  vpc_id                    = "vpc-029b74cf175d91328"    # Change the VPC ID
}
