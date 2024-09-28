#### Addons
module "metrics_server" {
  source       = "../../../modules/metrics-server"
  cluster_name = local.cluster_name
  awsRegion    = local.region
}

module "pod_identity" {
  source        = "../../../modules/pod-identity"
  cluster_name  = local.cluster_name
  addon_name    = local.addon_name
  addon_version = local.addon_version
}

module "cluster_auto_scale" {
  source       = "../../../modules/cluster-auto-scale"
  cluster_name = local.cluster_name
  awsRegion    = local.region

  depends_on = [ module.metrics_server ]
}

module "dev_user" {
  source              = "../../../modules/user/dev-user"
  cluster_name        = local.cluster_name
  k8s_dev_groups_name = local.k8s_dev_groups_name
  dev_user_name       = local.dev_user_name
}

module "manager_user" {
  source                = "../../../modules/user/admin-user"
  admin_user_name       = local.admin_user_name
  cluster_name          = local.cluster_name
  kubernetes_group_name = local.kubernetes_group_name
}

module "ebs-csi-driver" {
  source       = "../../../modules/ebs-csi-driver"
  cluster_name = local.cluster_name
}

module "efs-csi-driver" {
  source                    = "../../../modules/efs-csi-driver"
  cluster_name              = local.cluster_name
  cluster_oidc_issuer       = local.cluster_oidc_issuer
  cluster_security_group_id = [local.cluster_security_group_id]
  subnet_id_1               = local.subnet_id_1
  subnet_id_2               = local.subnet_id_2
}

### ingress-nginx nlb
module "ingress-nginx-nlb" {
  source       = "../../../modules/ingress"
  cluster_name = local.cluster_name
  vpc_id       = local.vpc_id

  depends_on = [ module.cluster_auto_scale ]
}

