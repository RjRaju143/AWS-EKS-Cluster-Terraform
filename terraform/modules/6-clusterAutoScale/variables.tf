variable "cluster_autoscaler_name" {
  description = "The name of the EKS cluster AutScaler"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "The regin of the EKS cluster"
  type        = string
}

# variable "dependson" {
#   description = "The regin of the EKS cluster"
#   type        = list(string)
# }

