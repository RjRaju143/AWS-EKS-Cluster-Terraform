#### Addons
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
  depends_on   = [module.metrics_server]
}

module "openid_connect_provider" {
  source     = "../../../modules/openid_connect_provider"
  url        = "https://oidc.eks.ap-south-2.amazonaws.com/id/0B576E5F60EACAF6549E79FBFD44C96E"
}

module "dev_user" {
  source              = "../../../modules/user/dev-user"
  cluster_name        = local.cluster_name
  dev_groups_name = local.dev_groups_name
  dev_user_name       = local.dev_user_name
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
  cluster_security_group_id = [data.terraform_remote_state.cluster.outputs.cluster_security_group_id]
  subnet_id_1               = data.terraform_remote_state.cluster.outputs.VPC.private_subnet1_id
  subnet_id_2               = data.terraform_remote_state.cluster.outputs.VPC.private_subnet2_id
  cluster_oidc_issuer       = module.openid_connect_provider.aws_iam_openid_connect_provider.url 
  cluster_oidc_issuer_arn   = module.openid_connect_provider.aws_iam_openid_connect_provider.url
}

### ingress-nginx nlb
module "ingress-nginx-nlb" {
  source       = "../../../modules/ingress"
  cluster_name = local.cluster_name
  vpc_id       = data.terraform_remote_state.cluster.outputs.VPC.vpc_id
  depends_on   = [module.cluster_auto_scale]
}

## TODO:
module "aws_auth" {
  source = "../../../modules/aws_auth"
  cluster_name = "staging-cluster"
  region = "ap-south-2"
}

