locals {
  environment                  = "staging"
  region                       = "ap-south-1"
  cluster_name                 = "staging-cluster"
  cluster_version              = "1.32" # or your preferred EKS version
  instance_types               = ["t3.medium"]
  node_group_name              = "staging-cluster-general"
  subnet1_id                   = "subnet-096aeb1d6c4497f01"
  subnet2_id                   = "subnet-0bc431a9a0bb2943c"
  vpn_source_security_group_id = "sg-043d6bd7d65c00d71"
}
