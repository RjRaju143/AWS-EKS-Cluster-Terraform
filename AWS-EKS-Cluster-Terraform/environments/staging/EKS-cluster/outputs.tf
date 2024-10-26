output "aws_region" {
  description = "The AWS region where resources are created"
  value       = "${local.region}"
}

output "VPC" {
  description = "The ID of the second public subnet created in availability zone 2"
  value       = data.terraform_remote_state.vpc.outputs
}

output "eks_cluster_id" {
  description = "The name of the EKS cluster"
  value       = module.eks_cluster.eks_cluster.id
}

output "cluster_security_group_id" {
  description = "The ID of the security group associated with the EKS cluster"
  value       = module.eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "eks_oidc_identity" {
  value = module.eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks_cluster.eks_cluster.name
}

output "eks_node_group_id" {
  description = "The ID of the EKS node group"
  value       = module.eks_cluster.eks_node_group_id
}

output "eks_node_group_ami_type" {
  description = "The AMI type used by the EKS node group"
  value       = module.eks_cluster.eks_node_group.ami_type
}

output "eks_node_group_instance_types" {
  description = "The instance types used by the EKS node group"
  value       = module.eks_cluster.eks_node_group.instance_types
}

output "eks_node_group__name" {
  description = "The name of the EKS node group"
  value       = module.eks_cluster.eks_node_group.node_group_name
}
