variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_admin" {
  description = "The name of the Admin EKS cluster"
  type        = string
}

variable "admin_iam_user_name" {
  description = "The name of the Admin IAM user of EKS cluster"
  type        = string
}

variable "kubernetes_groups" {
  description = "The name of the Admin IAM user of EKS cluster"
  type        = list(string)
}
