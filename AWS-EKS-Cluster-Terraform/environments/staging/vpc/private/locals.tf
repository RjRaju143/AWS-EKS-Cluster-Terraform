locals {
  region               = "ap-south-1"
  vpc_name             = "staging-main"
  vpc_cidr             = "10.0.0.0/16"
  private_subnet1_cidr = "10.0.0.0/19"
  private_subnet2_cidr = "10.0.32.0/19"
  public_subnet1_cidr  = "10.0.64.0/19"
  public_subnet2_cidr  = "10.0.96.0/19"
  cluster_name         = "staging-cluster"
  igw_cidr             = "0.0.0.0/0"
  nat_cidr             = "0.0.0.0/0"
}
