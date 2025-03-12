locals {
  environment                  = "staging"
  region                       = "ap-south-1"
  cluster_name                 = "staging-cluster"
  cluster_version              = "1.32" # or your preferred EKS version
  instance_types               = ["t3.medium"]
  node_group_name              = "staging-cluster-general"
  subnet1_id                   = "subnet-0997be57784794d15"
  subnet2_id                   = "subnet-019dd6f3adcaac5eb"
  vpn_source_security_group_id = "sg-031364a8b79445b84"
}
