### VPC STATE
data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    # path = "../vpc/public/terraform.tfstate" # public vpc
    path = "../vpc/private/terraform.tfstate" # private vpc
  }
}

# #### Public VPC
# module "eks" {
#   source = "../../../modules/eks"

#   name            = local.cluster_name
#   eksversion      = local.cluster_version
#   subnet_ids      = [local.public_subnet1_id, local.public_subnet2_id]
#   public_zone1    = local.public_subnet1_id
#   public_zone2    = local.public_subnet2_id
#   desired_size    = 1
#   max_size        = 3
#   min_size        = 1
#   instance_types  = local.instance_types
#   node_group_name = local.node_group_name
# }

#### Private VPC
module "eks" {
  source = "../../../modules/eks"

  environment     = local.environment
  name            = local.cluster_name
  eksversion      = local.cluster_version
  desired_size    = 1
  max_size        = 3
  min_size        = 1
  instance_types  = local.instance_types
  node_group_name = local.node_group_name
  subnet_ids      = [local.private_subnet1_id, local.private_subnet2_id]
  # subnet_ids      = [local.public_subnet1_id, local.public_subnet2_id]
}

