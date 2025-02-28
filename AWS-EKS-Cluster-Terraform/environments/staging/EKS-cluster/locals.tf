locals {
  environment                  = "staging"
  region                       = "ap-south-1"
  cluster_name                 = "staging-cluster"
  cluster_version              = "1.32" # or your preferred EKS version
  instance_types               = ["t3.medium"]
  node_group_name              = "staging-cluster-general"
  subnet1_id                   = "subnet-068c3c6793f836751"
  subnet2_id                   = "subnet-0fabc98a6ab8a4944"
  vpn_source_security_group_id = "sg-0f4380a9b1433b21e"
}
