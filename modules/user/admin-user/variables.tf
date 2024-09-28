variable "admin_user_name" {
  description = "Eks Admin User name"
  type        = string
  default     = "manager"
}

variable "kubernetes_group_name" {
  description = "EKS group name"
  type        = list(string)
  default     = ["my-admin"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}


