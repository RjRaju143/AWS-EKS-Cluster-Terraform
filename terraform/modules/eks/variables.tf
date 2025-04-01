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

variable "environment" {
  description = "environment name"
  type        = string
}

variable "capacity_type" {
  description = "capacity type"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "disk size"
  type        = number
  default     = 20
}

variable "endpoint_private_access" {
  description = "endpoint_private_access"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "endpoint_public_access"
  type        = bool
  default     = true
}

variable "vpn_source_security_group_id" {
  default = "vpn security group id"
  type    = string
}

variable "key_name" {
  description = "The name of the VPN Server SSH key pair"
  type        = string
}
