locals {
  environment        = "staging"
  region             = "ap-south-1"
  cluster_name       = "staging-cluster"
  cluster_version    = "1.32" # or your preferred EKS version
  instance_types     = ["t3.medium"]
  node_group_name    = "staging-cluster-general"

  subnet1_id = "subnet-0723c0569934e3666"
  subnet2_id = "subnet-0bb48b083fd985d90"
}
