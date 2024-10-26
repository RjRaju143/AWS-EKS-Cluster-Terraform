locals {
  environment        = "staging"
  region             = "ap-south-2"
  cluster_name       = "staging-cluster"
  cluster_version    = "1.31" # or your preferred EKS version
  instance_types     = ["t3.medium"]
  node_group_name    = "staging-cluster-general"

  # Set subnet IDs based on the VPC type
  public_subnet1_id  = data.terraform_remote_state.vpc.outputs.public_subnet1_id
  public_subnet2_id  = data.terraform_remote_state.vpc.outputs.public_subnet2_id

  # private_subnet1_id = data.terraform_remote_state.vpc.outputs.private_subnet1_id
  # private_subnet2_id = data.terraform_remote_state.vpc.outputs.private_subnet2_id
}
