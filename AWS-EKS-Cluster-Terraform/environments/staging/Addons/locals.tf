locals {
  region                    = "ap-south-2"
  cluster_name              = "staging-cluster"
  addon_name                = "eks-pod-identity-agent"
  addon_version             = "v1.3.0-eksbuild.1"
  dev_user_name             = "developer"
  dev_groups_name           = ["my-viewer"]
  admin_user_name           = "manager"
  kubernetes_group_name     = ["admin"]
  manager_iam_role_name     = "eks-admin"
}
