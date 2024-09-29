variable "name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eksversion" {
  description = "The EKS cluster version"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets"
  type        = list(string)
}

# variable "public_zone1" {
#   description = "public zone 1"
#   type        = string
# }

# variable "public_zone2" {
#   description = "public zone 2"
#   type        = string
# }

variable "instance_types" {
  description = "The instance types for the node group"
  type        = list(string)
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
}

variable "node_group_name" {
  description = "node group name"
  type        = string
  default     = "general"
}
