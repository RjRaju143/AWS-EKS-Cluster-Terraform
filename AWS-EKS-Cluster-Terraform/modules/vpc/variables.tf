variable "use_public_vpc" {
  description = "Set to true if you want to create a public VPC."
  type        = bool
  default     = true
}

variable "use_private_vpc" {
  description = "Set to true if you want to create a private VPC."
  type        = bool
  default     = true
}

variable "region" {
  description = "The AWS region to deploy the VPC."
  type        = string
  # default     = "ap-south-2"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "main-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  # default     = "10.0.0.0/16"
}

variable "private_subnet1_cidr" {
  description = "CIDR block for private subnet 1."
  type        = string
  # default     = "10.0.0.0/19"
}

variable "private_subnet2_cidr" {
  description = "CIDR block for private subnet 2."
  type        = string
  # default     = "10.0.32.0/19"
}

variable "public_subnet1_cidr" {
  description = "CIDR block for public subnet 1."
  type        = string
  # default     = "10.0.64.0/19"
}

variable "public_subnet2_cidr" {
  description = "CIDR block for public subnet 2."
  type        = string
  # default     = "10.0.96.0/19"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  # default     = "staging-cluster"
}

variable "igw_cidr" {
  description = "CIDR block for internet gateway."
  type        = string
  # default     = "0.0.0.0/0"
}

variable "nat_cidr" {
  description = "CIDR block for NAT gateway."
  type        = string
  # default     = "0.0.0.0/0"
}
