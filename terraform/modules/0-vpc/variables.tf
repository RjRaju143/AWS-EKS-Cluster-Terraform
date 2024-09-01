variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "name" {
  description = "The name of the VPC"
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

variable "zone1" {
  description = "The availability zone for public subnet 1"
  type        = string
}

variable "zone2" {
  description = "The availability zone for public subnet 2"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}
