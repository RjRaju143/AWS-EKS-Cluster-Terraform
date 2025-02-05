variable "is_private" {
  description = "Deploy a private VPC if true, otherwise deploy a public VPC"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "zone1" {
  description = "Availability Zone 1"
  type        = string
}

variable "zone2" {
  description = "Availability Zone 2"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "Public Subnet 1 CIDR"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "Public Subnet 2 CIDR"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "Private Subnet 1 CIDR"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "Private Subnet 2 CIDR"
  type        = string
}

variable "igw_cidr" {
  description = "internet gateway CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

variable "nat_cidr" {
  description = "NAT gateway CIDR"
  type        = string
  default     = "0.0.0.0/0"
}

module "public" {
  source              = "./public"
  count               = var.is_private ? 0 : 1
  name                = var.name
  cidr_block          = var.cidr_block
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  zone1               = var.zone1
  zone2               = var.zone2
  cluster_name        = var.cluster_name
}

module "private" {
  source               = "./private"
  count                = var.is_private ? 1 : 0
  name                 = var.name
  vpc_cidr             = var.cidr_block
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  cluster_name         = var.cluster_name
  private_zone1        = var.zone1
  private_zone2        = var.zone2
  public_zone1         = var.zone1
  public_zone2         = var.zone2
  igw_cidr             = var.igw_cidr
  nat_cidr             = var.nat_cidr
}

