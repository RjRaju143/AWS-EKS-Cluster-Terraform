module "vpc" {
  source               = "../../../modules/vpc"
  is_private           = local.is_private #true # Change to false if you want a public VPC Default is false (public VPC)
  name                 = local.name
  cidr_block           = local.cidr_block
  public_subnet1_cidr  = local.public_subnet1_cidr
  public_subnet2_cidr  = local.public_subnet2_cidr
  private_subnet1_cidr = local.private_subnet1_cidr
  private_subnet2_cidr = local.private_subnet2_cidr
  zone1                = local.zone1
  zone2                = local.zone2
  cluster_name         = local.cluster_name
  igw_cidr             = local.igw_cidr
  nat_cidr             = local.nat_cidr
}

