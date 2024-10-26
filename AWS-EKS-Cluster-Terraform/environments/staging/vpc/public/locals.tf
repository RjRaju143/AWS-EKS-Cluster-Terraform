locals {
  region              = "ap-south-2"
  az1                 = "ap-south-2a"
  az2                 = "ap-south-2b"
  vpc_name            = "staging-main"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet1_cidr = "10.0.64.0/19"
  public_subnet2_cidr = "10.0.96.0/19"
  cluster_name        = "staging-cluster"
}

