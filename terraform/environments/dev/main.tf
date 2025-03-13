module "vpc" {
  source               = "../../modules/vpc"
  is_private           = local.is_private #true # Change to false if you want a public VPC Default is false (public VPC)
  name                 = local.name
  cidr_block           = local.cidr_block
  public_subnet1_cidr  = local.public_subnet1_cidr
  public_subnet2_cidr  = local.public_subnet2_cidr
  private_subnet1_cidr = local.private_subnet1_cidr
  private_subnet2_cidr = local.private_subnet2_cidr
  zone1                = local.zone1
  zone2                = local.zone2
  cluster_name         = local.cluster_name
  igw_cidr             = local.igw_cidr
  nat_cidr             = local.nat_cidr
}

## OpenVPN
module "OpenVpn" {
  source           = "../../modules/OpenVpn"
  vpc_id           = module.vpc.vpc[0].vpc_main.id       #"vpc-0aaf65c19284fa30e" #module.vpc.vpc_main.id
  subnet_id        = module.vpc.vpc[0].public_subnet1_id #"subnet-0d097a2dcf4c876e3" #module.vpc.public_zone1.id
  vpn_server_name  = local.vpn_server_name               #"openVpn" #local.vpn_name
  key_name         = local.key_name
  ami_id           = local.ami_id
  vpn_server_ports = local.vpn_server_ports
}

### EKS
module "eks_cluster" {
  source                       = "../../modules/eks"
  environment                  = local.environment
  name                         = local.cluster_name
  eksversion                   = local.cluster_version
  endpoint_private_access      = local.endpoint_private_access
  endpoint_public_access       = local.endpoint_public_access
  desired_size                 = local.desired_size
  max_size                     = local.max_size
  min_size                     = local.min_size
  instance_types               = local.instance_types
  node_group_name              = local.node_group_name
  subnet_ids                   = [module.vpc.vpc[0].private_subnet1_id, module.vpc.vpc[0].private_subnet2_id] # Use subnet IDs based on whether it's a private or public VPC
  vpn_source_security_group_id = module.OpenVpn.security_group.id                                             # subnet ID of public Instance (JumpBox or Bastion Host or VPN Server) 
}

### Addons
#####
module "metrics_server" {
  source       = "../../modules/metrics-server"
  cluster_name = module.eks_cluster.eks_cluster_name #local.cluster_name
  depends_on   = [module.eks_cluster]
}

module "pod_identity" {
  source        = "../../modules/pod-identity"
  cluster_name  = module.eks_cluster.eks_cluster_name
  addon_name    = local.addon_name
  addon_version = local.addon_version
  depends_on    = [module.eks_cluster]
}

module "cluster_auto_scale" {
  source       = "../../modules/cluster-auto-scale"
  cluster_name = module.eks_cluster.eks_cluster_name
  region       = local.region
  depends_on   = [module.metrics_server]
}

module "openid_connect_provider" {
  source = "../../modules/openid_connect_provider"
  url    = module.eks_cluster.oidc_issuer #local.openid_connect_provider
}
