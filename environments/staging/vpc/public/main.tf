module "vpc" {
  source              = "../../../../modules/vpc/public"

  name                = local.vpc_name
  cidr_block          = local.vpc_cidr
  public_subnet1_cidr = local.public_subnet1_cidr
  public_subnet2_cidr = local.public_subnet2_cidr
  zone1               = local.az1
  zone2               = local.az2
  cluster_name        = local.cluster_name
}
