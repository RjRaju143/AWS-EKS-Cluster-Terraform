module "eks_cluster" {
  source          = "../../../modules/eks"
  environment     = local.environment
  name            = local.cluster_name
  eksversion      = local.cluster_version
  desired_size    = 1
  max_size        = 2
  min_size        = 1
  instance_types  = local.instance_types
  node_group_name = local.node_group_name

  # Use subnet IDs based on whether it's a private or public VPC
  subnet_ids      = [local.public_subnet1_id, local.public_subnet2_id]
  # subnet_ids      = [local.private_subnet1_id, local.private_subnet2_id]
}
