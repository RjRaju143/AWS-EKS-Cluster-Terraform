variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "The CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "The CIDR block for public subnet 2"
  type        = string
}
###
variable "private_subnet1_cidr" {
  description = "The CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "The CIDR block for private subnet 2"
  type        = string
}

# igw_cidr
variable "igw_cidr" {
  description = "The CIDR block for igw_cidr"
  type        = string
  default = "0.0.0.0/0"
}

# nat_cidr
variable "nat_cidr" {
  description = "The CIDR block for igw_cidr"
  type        = string
  default = "0.0.0.0/0"
}

###
variable "private_zone1" {
  description = "The availability zone for public subnet 1"
  type        = string
}

variable "private_zone2" {
  description = "The availability zone for public subnet 2"
  type        = string
}


variable "public_zone1" {
  description = "The availability zone for public subnet 1"
  type        = string
}

variable "public_zone2" {
  description = "The availability zone for public subnet 2"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "dev-cluster"
}
