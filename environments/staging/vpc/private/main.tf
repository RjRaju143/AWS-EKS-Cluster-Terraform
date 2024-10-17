module "vpc" {
  source               = "../../../../modules/vpc/private"

  name                 = local.vpc_name
  vpc_cidr             = local.vpc_cidr
  private_subnet1_cidr = local.private_subnet1_cidr
  private_subnet2_cidr = local.private_subnet2_cidr
  public_subnet1_cidr  = local.public_subnet1_cidr
  public_subnet2_cidr  = local.public_subnet2_cidr
  cluster_name         = local.cluster_name
  private_zone1        = local.private_zone1
  private_zone2        = local.private_zone2
  public_zone1         = local.private_zone1
  public_zone2         = local.private_zone2
  igw_cidr             = local.igw_cidr
  nat_cidr             = local.nat_cidr
}
