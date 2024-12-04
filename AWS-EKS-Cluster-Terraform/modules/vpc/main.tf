module "private_vpc" {
  source               = "./private"

  name                 = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  cluster_name         = var.cluster_name
  private_zone1        = "${var.region}a"
  private_zone2        = "${var.region}b"
  public_zone1         = "${var.region}a"
  public_zone2         = "${var.region}b"
  igw_cidr             = var.igw_cidr
  nat_cidr             = var.nat_cidr

  count                = var.use_private_vpc ? 1 : 0
}

module "public_vpc" {
  source              = "./public"

  name                = var.vpc_name
  cidr_block          = var.vpc_cidr
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  public_zone1        = "${var.region}a"
  public_zone2        = "${var.region}b"
  cluster_name        = var.cluster_name

  count               = var.use_public_vpc ? 1 : 0
}
