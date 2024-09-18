###### TODO
locals {
  cluster_name          = "dev-cluster"
  kubernetes_group_name = ["my-admin"]
  admin_user_name       = "manager"
}

module "manager_user" {
  source                = "../../../modules/4-manager-user"
  admin_user_name       = local.admin_user_name
  cluster_name          = local.cluster_name
  kubernetes_group_name = local.kubernetes_group_name
}

