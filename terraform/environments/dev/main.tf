module "vpc" {
  source = "../../modules/vpc"

  name                = local.vpc_name
  cidr_block          = local.vpc_cidr
  public_subnet1_cidr = local.public_subnet1_cidr
  public_subnet2_cidr = local.public_subnet2_cidr
  zone1               = local.az1
  zone2               = local.az2
  cluster_name        = local.cluster_name
}

module "eks" {
  source = "../../modules/eks"

  name            = local.cluster_name
  eksversion      = local.cluster_version
  subnet_ids      = [module.vpc.public_subnet1_id, module.vpc.public_subnet2_id]
  public_zone1    = module.vpc.public_subnet1_id
  public_zone2    = module.vpc.public_subnet2_id
  desired_size    = 1
  max_size        = 10
  min_size        = 1
  instance_types  = local.instance_types
  node_group_name = local.node_group_name
}

module "metrics_server" {
  source = "../../modules/metrics-server"

  # cluster_name = local.cluster_name
  cluster_name = module.eks.eks_cluster_name
  awsRegion    = local.region
}

module "pod_identity" {
  source        = "../../modules/pod-identity"
  cluster_name  = module.eks.eks_cluster_name
  addon_name    = local.addon_name
  addon_version = local.addon_version
}

module "cluster_auto_scale" {
  source       = "../../modules/cluster-auto-scale"
  cluster_name = local.cluster_name
  awsRegion    = local.region
}

module "ebs-csi-driver" {
  source = "../../modules/ebs-csi-driver"

  cluster_name = local.cluster_name
}

module "manager_user" {
  source                = "../../modules/manager-user"
  admin_user_name       = local.admin_user_name
  cluster_name          = local.cluster_name
  kubernetes_group_name = local.kubernetes_group_name
}

# ## TODO: EFS module
# module "efs" {
#   source = "../../modules/4-efs-csi-driver"

#   # cluster_name               = aws_eks_cluster.eks.name
#   cluster_name               = module.eks.eks_cluster_name
#   # cluster_oidc_issuer_url    = aws_eks_cluster.eks.identity[0].oidc[0].issuer
#   cluster_oidc_issuer_url    = module.eks.eks_oidc_identity
#   # cluster_oidc_issuer_url    = module.eks.
#   subnet_id_1                = module.vpc.public_subnet1_id
#   subnet_id_2                = module.vpc.public_subnet2_id
#   cluster_security_group_id  = module.eks.cluster_security_group_id
# }
