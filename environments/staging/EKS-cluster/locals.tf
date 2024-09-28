locals {
  region              = "ap-south-1"
  cluster_name        = "staging-cluster"
  cluster_version     = "1.31" # or your preferred EKS version
  instance_types      = ["t2.medium"]
  node_group_name     = "staging-cluster-general"

  public_subnet1_id = data.terraform_remote_state.vpc.outputs.public_subnet1_id
  public_subnet2_id = data.terraform_remote_state.vpc.outputs.public_subnet2_id
}
