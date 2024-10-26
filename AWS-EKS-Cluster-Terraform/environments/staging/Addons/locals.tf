locals {
  region                    = data.terraform_remote_state.cluster.outputs.aws_region
  cluster_name              = data.terraform_remote_state.cluster.outputs.eks_cluster_name
  addon_name                = "eks-pod-identity-agent"
  addon_version             = "v1.3.0-eksbuild.1"
  dev_user_name             = "developer"
  k8s_dev_groups_name       = ["my-viewer"]
  admin_user_name           = "manager"
  kubernetes_group_name     = ["my-admin"]
}
