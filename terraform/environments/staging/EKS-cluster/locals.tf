locals {
  environment                  = "staging"
  region                       = "ap-south-1"
  cluster_name                 = "staging-cluster"
  cluster_version              = "1.32" # or your preferred EKS version
  instance_types               = ["t3.medium"]
  node_group_name              = "staging-cluster-general"
  subnet1_id                   = "subnet-0a6bce6060a0c0256"
  subnet2_id                   = "subnet-046204a8c72f17115"
  vpn_source_security_group_id = "sg-0740b4257fc0c03aa"
  key_name                     = "staging-cluster" # Name of the key pair to be used for SSH access
}
