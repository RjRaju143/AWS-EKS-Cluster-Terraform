variable "admin_user_name" {
  description = "Eks Admin User name"
  type        = string
  default     = "manager"
}

variable "kubernetes_group_name" {
  description = "EKS group name"
  type        = list(string)
  default     = ["admin"]
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}


variable "iam_role_name" {
  description = "The name of eks iam role"
  type = string
  default = "eks-admin"
}
