locals {
  environment        = "staging"
  region             = "ap-south-1"
  cluster_name       = "staging-cluster"
  cluster_version    = "1.31" # or your preferred EKS version
  instance_types     = ["t3.medium"]
  node_group_name    = "staging-cluster-general"

  subnet1_id = "subnet-0b947ede9113006cd"
  subnet2_id = "subnet-01dc0dbd696df085f"
}
