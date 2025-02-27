locals {
  environment     = "staging"
  region          = "ap-south-1"
  cluster_name    = "staging-cluster"
  cluster_version = "1.32" # or your preferred EKS version
  instance_types  = ["t3.medium"]
  node_group_name = "staging-cluster-general"
  subnet1_id      = "subnet-08180f7148adfd617"
  subnet2_id      = "subnet-011bc855ef4d4400d"
}
