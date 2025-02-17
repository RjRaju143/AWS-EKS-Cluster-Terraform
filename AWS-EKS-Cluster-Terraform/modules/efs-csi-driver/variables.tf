variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_oidc_issuer" {
  description = "The URL on the EKS cluster for the OpenID Connect identity provider"
  type        = string
}

variable "cluster_oidc_issuer_arn" {
  description = "ARN of EKS cluster for the OpenID Connect identity provider"
  type        = string
}

variable "subnet_id_1" {
  description = "ID of the first subnet to create an EFS mount target"
  type        = string
}

variable "subnet_id_2" {
  description = "ID of the second subnet to create an EFS mount target"
  type        = string
}

variable "cluster_security_group_id" {
  description = "Security group ID of the EKS cluster"
  type        = list(string)
}
