### Addons
#####
module "metrics_server" {
  source       = "../../../modules/metrics-server"
  cluster_name = local.cluster_name
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
  region       = local.region
}

module "openid_connect_provider" {
  source = "../../../modules/openid_connect_provider"
  url    = local.openid_connect_provider
}

module "dev_user" {
  source          = "../../../modules/user/dev-user"
  cluster_name    = local.cluster_name
  dev_groups_name = local.dev_groups_name
  dev_user_name   = local.dev_user_name
}

module "manager_user" {
  source                = "../../../modules/user/admin-user"
  admin_user_name       = local.admin_user_name
  cluster_name          = local.cluster_name
  kubernetes_group_name = local.kubernetes_group_name
  iam_role_name         = local.manager_iam_role_name
}

module "ebs-csi-driver" {
  source       = "../../../modules/ebs-csi-driver"
  cluster_name = local.cluster_name
}

module "efs-csi-driver" {
  source                    = "../../../modules/efs-csi-driver"
  cluster_name              = local.cluster_name
  cluster_security_group_id = local.cluster_security_group_id # Change this to your EKS security group id
  subnet_id_1               = local.subnet_id_1               # Change this to your subnet id
  subnet_id_2               = local.subnet_id_2               # Change this to your subnet id
  cluster_oidc_issuer       = module.openid_connect_provider.aws_iam_openid_connect_provider.url
  cluster_oidc_issuer_arn   = module.openid_connect_provider.aws_iam_openid_connect_provider.url
}

##### ingress-nginx nlb
module "ingress-nginx-nlb" {
  source       = "../../../modules/ingress"
  cluster_name = local.cluster_name
  vpc_id       = local.vpc_id # Change the VPC ID
  depends_on   = [module.cluster_auto_scale]
}

