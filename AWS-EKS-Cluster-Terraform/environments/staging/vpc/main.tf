module "vpc" {
  source = "../../../modules/vpc"

  use_private_vpc = false
  use_public_vpc  = true

  vpc_name = "main-vpc"
  region = "ap-south-2"
  vpc_cidr = "10.0.0.0/16"
  private_subnet1_cidr = "10.0.0.0/24"
  private_subnet2_cidr = "10.0.1.0/24"
  public_subnet1_cidr  = "10.1.0.0/24"
  public_subnet2_cidr  = "10.1.1.0/24"
  cluster_name  = "my-cluster"
  nat_cidr      = "0.0.0.0/0"
  igw_cidr      = "0.0.0.0/0"

}

