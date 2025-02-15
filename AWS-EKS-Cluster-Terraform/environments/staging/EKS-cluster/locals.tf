locals {
  environment        = "staging"
  region             = "ap-south-1"
  cluster_name       = "staging-cluster"
  cluster_version    = "1.32" # or your preferred EKS version
  instance_types     = ["t3.medium"]
  node_group_name    = "staging-cluster-general"

  subnet1_id = "subnet-0e9a450cec6606fdf"
  subnet2_id = "subnet-0b396881398efc750"
}
