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
  openid_connect_provider   = "https://oidc.eks.ap-south-1.amazonaws.com/id/6F1E731590D011EA42A381875B81992E" # Change this to your EKS openid connect provider
  cluster_security_group_id = ["sg-05be0c3e8f0e409ff"]                                                        # Change this to your EKS security group id
  subnet_id_1               = "subnet-0997be57784794d15"                                                      # Change this to your subnet id
  subnet_id_2               = "subnet-019dd6f3adcaac5eb"                                                      # Change this to your subnet id
  vpc_id                    = "vpc-0343a219a1ec162e4"                                                         # Change the VPC ID
}
