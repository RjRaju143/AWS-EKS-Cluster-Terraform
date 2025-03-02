locals {
  environment                  = "staging"
  region                       = "ap-south-1"
  cluster_name                 = "staging-cluster"
  cluster_version              = "1.32" # or your preferred EKS version
  instance_types               = ["t3.medium"]
  node_group_name              = "staging-cluster-general"
  subnet1_id                   = "subnet-02a74551cb84e4ac7"
  subnet2_id                   = "subnet-02e12c21ff759c471"
  vpn_source_security_group_id = "sg-0047080f16014b7f0"
}
