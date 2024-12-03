module "vpc" {
  source               = "../../modules/vpc/private"
  name                 = local.vpc_name
  vpc_cidr             = local.vpc_cidr
  private_subnet1_cidr = local.private_subnet1_cidr
  private_subnet2_cidr = local.private_subnet2_cidr
  public_subnet1_cidr  = local.public_subnet1_cidr
  public_subnet2_cidr  = local.public_subnet2_cidr
  cluster_name         = local.cluster_name
  private_zone1        = "${local.region}a"
  private_zone2        = "${local.region}b"
  public_zone1         = "${local.region}a"
  public_zone2         = "${local.region}b"
  igw_cidr             = local.igw_cidr
  nat_cidr             = local.nat_cidr
}

module "eks_cluster" {
  source          = "../../modules/eks"
  environment     = local.environment
  name            = local.cluster_name
  eksversion      = local.cluster_version
  desired_size    = 1
  max_size        = 2
  min_size        = 1
  disk_size       = 20
  capacity_type   = local.capacity_type
  instance_types  = local.instance_types
  node_group_name = local.node_group_name
  subnet_ids      = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]
}

module "metrics_server" {
  source       = "../../modules/metrics-server"
  cluster_name = local.cluster_name
  depends_on   = [module.eks_cluster.node_group] # Updated dependency on the node group
}

module "cluster_auto_scale" {
  source       = "../../modules/cluster-auto-scale"
  cluster_name = local.cluster_name
  region       = local.region
  depends_on   = [module.eks_cluster.node_group, module.metrics_server] # Ensure metrics server is installed first
}

module "pod_identity" {
  source        = "../../modules/pod-identity"
  cluster_name  = local.cluster_name
  addon_name    = local.addon_name
  addon_version = local.addon_version
  depends_on    = [module.eks_cluster]
}

module "openid_connect_provider" {
  source     = "../../modules/openid_connect_provider"
  url        = module.eks_cluster.oidc_issuer
  depends_on = [module.eks_cluster]
}

# module "ebs-csi-driver" {
#   source       = "../../modules/ebs-csi-driver"
#   cluster_name = local.cluster_name
#   depends_on   = [module.eks_cluster]
# }

##### TODO: ######
# module "efs-csi-driver" {
#   source                    = "../../modules/efs-csi-driver"
#   cluster_name              = local.cluster_name
#   cluster_security_group_id = [module.eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id]
#   subnet_id_1               = module.vpc.private_subnet1_id
#   subnet_id_2               = module.vpc.private_subnet2_id
#   cluster_oidc_issuer       = module.eks_cluster.oidc_issuer
#   cluster_oidc_issuer_arn = module.openid_connect_provider.aws_iam_openid_connect_provider.arn

#   # depends_on = [ module.eks_cluster.node_group ]
# }

# module "dev_user" {
#   source              = "../../modules/user/dev-user"
#   cluster_name        = local.cluster_name
#   k8s_dev_groups_name = local.k8s_dev_groups_name
#   dev_user_name       = local.dev_user_name
#   depends_on = [ module.eks_cluster ]
# }

# module "manager_user" {
#   source                = "../../modules/user/admin-user"
#   admin_user_name       = local.admin_user_name
#   cluster_name          = local.cluster_name
#   kubernetes_group_name = local.kubernetes_group_name
#   depends_on = [ module.eks_cluster ]
# }
##### TODO: ######

### ingress-nginx nlb
# module "ingress-nginx-nlb" {
#   source       = "../../modules/ingress"
#   cluster_name = local.cluster_name
#   vpc_id       = module.vpc.vpc_main.id
#   depends_on   = [module.cluster_auto_scale]
# }


