module "vpc" {
  source               = "../../../../modules/vpc/private"

  name                 = local.vpc_name
  vpc_cidr             = local.vpc_cidr
  private_subnet1_cidr = local.private_subnet1_cidr
  private_subnet2_cidr = local.private_subnet2_cidr
  public_subnet1_cidr  = local.public_subnet1_cidr
  public_subnet2_cidr  = local.public_subnet2_cidr
  cluster_name         = local.cluster_name
  private_zone1        = "${local.region}a"
  private_zone2        = "${local.region}b"
  public_zone1         = "${local.region}a"
  public_zone2         = "${local.region}b"
  igw_cidr             = local.igw_cidr
  nat_cidr             = local.nat_cidr
}
