locals {
  is_private           = true # Change to false if you want a public VPC Default is false (public VPC)
  name                 = "dev-main"
  cidr_block           = "10.0.0.0/16"
  public_subnet1_cidr  = "10.0.64.0/19"
  public_subnet2_cidr  = "10.0.96.0/19"
  private_subnet1_cidr = "10.0.0.0/19"
  private_subnet2_cidr = "10.0.32.0/19"
  zone1                = "ap-south-1a"
  zone2                = "ap-south-1b"
  cluster_name         = "dev-cluster"
  igw_cidr             = "0.0.0.0/0"
  nat_cidr             = "0.0.0.0/0"
}
