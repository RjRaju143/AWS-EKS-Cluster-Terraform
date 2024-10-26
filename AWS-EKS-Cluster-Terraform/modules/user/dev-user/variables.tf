variable "k8s_dev_groups_name" {
  description = "The name of the EKS group name"
  type        = list(string)
}

variable "dev_user_name" {
  description = "The name of the EKS dev user name"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

