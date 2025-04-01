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

resource "aws_key_pair" "ssh_key" {
  key_name   = "staging-cluster"
  public_key = file("../ssh-key/staging-cluster.pub")
}

## OpenVPN
module "OpenVpn" {
  source           = "../../modules/OpenVpn"
  vpc_id           = module.vpc.vpc[0].vpc_main.id       #"vpc-0aaf65c19284fa30e" #module.vpc.vpc_main.id
  subnet_id        = module.vpc.vpc[0].public_subnet1_id #"subnet-0d097a2dcf4c876e3" #module.vpc.public_zone1.id
  vpn_server_name  = local.vpn_server_name               #"openVpn" #local.vpn_name
  ami_id           = local.ami_id
  vpn_server_ports = local.vpn_server_ports
  key_name         = aws_key_pair.ssh_key.key_name
  depends_on       = [aws_key_pair.ssh_key]
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
  key_name                     = aws_key_pair.ssh_key.key_name
}
