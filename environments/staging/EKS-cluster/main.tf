module "eks" {
  source = "../../../modules/eks"

  name            = local.cluster_name
  eksversion      = local.cluster_version
  subnet_ids      = [local.public_subnet1_id, local.public_subnet2_id]
  public_zone1    = local.public_subnet1_id
  public_zone2    = local.public_subnet2_id
  desired_size    = 1
  max_size        = 3
  min_size        = 1
  instance_types  = local.instance_types
  node_group_name = local.node_group_name
}
