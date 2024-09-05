variable "user_name" {
  type        = string
  description = "Name of the IAM user for EKS access"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "kubernetes_groups" {
  type        = list(string)
  description = "List of Kubernetes groups the user should be part of"
}

