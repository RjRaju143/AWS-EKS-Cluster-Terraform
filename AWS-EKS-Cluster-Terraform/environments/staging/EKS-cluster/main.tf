module "eks_cluster" {
  source                       = "../../../modules/eks"
  environment                  = local.environment
  name                         = local.cluster_name
  eksversion                   = local.cluster_version
  endpoint_private_access      = true
  endpoint_public_access       = false
  desired_size                 = 1
  max_size                     = 3
  min_size                     = 1
  instance_types               = local.instance_types
  node_group_name              = local.node_group_name
  subnet_ids                   = [local.subnet1_id, local.subnet2_id] # Use subnet IDs based on whether it's a private or public VPC
  vpn_source_security_group_id = local.vpn_source_security_group_id # subnet ID of public Instance (JumpBox or Bastion Host or VPN Server) 
}
