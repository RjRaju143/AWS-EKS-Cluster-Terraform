### Stte of EKS cluster
data "terraform_remote_state" "cluster" {
  backend = "local"
  config = {
    path = "../EKS-cluster/terraform.tfstate"
  }
}

locals {
  region                    = data.terraform_remote_state.cluster.outputs.aws_region
  cluster_name              = data.terraform_remote_state.cluster.outputs.eks_cluster_name

  addon_name                = "eks-pod-identity-agent"
  addon_version             = "v1.3.0-eksbuild.1"
  dev_user_name             = "developer"
  k8s_dev_groups_name       = ["my-viewer"]
  admin_user_name           = "manager"
  kubernetes_group_name     = ["my-admin"]

  vpc_id                    = data.terraform_remote_state.cluster.outputs.vpc_id
  cluster_oidc_issuer       = data.terraform_remote_state.cluster.outputs.eks_oidc_identity
  cluster_security_group_id = data.terraform_remote_state.cluster.outputs.cluster_security_group_id

  subnet_id_1               = data.terraform_remote_state.cluster.outputs.private_subnet1_id
  subnet_id_2               = data.terraform_remote_state.cluster.outputs.private_subnet2_id
}
