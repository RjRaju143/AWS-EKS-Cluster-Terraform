locals {
  region              = "ap-south-1"
  cluster_name        = "staging-cluster"
  cluster_version     = "1.31" # or your preferred EKS version
  instance_types      = ["t2.medium"]
  node_group_name     = "staging-cluster-general"

  private_subnet1_id = data.terraform_remote_state.vpc.outputs.private_subnet1_id
  private_subnet2_id = data.terraform_remote_state.vpc.outputs.private_subnet2_id
}
