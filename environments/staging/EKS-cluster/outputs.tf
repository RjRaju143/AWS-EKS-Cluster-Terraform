output "aws_region" {
  description = "The AWS region where resources are created"
  value       = local.region
}

output "vpc_id" {
  description = "The ID of the main VPC created by the VPC module"
  value       = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "vpc_name" {
  description = "The name tag of the VPC created by the VPC module"
  value       = data.terraform_remote_state.vpc.outputs.vpc_name
}

output "aws_internet_gateway" {
  description = "The ID of the Internet Gateway created by the VPC module"
  value       = data.terraform_remote_state.vpc.outputs.aws_internet_gateway
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet created in availability zone 1"
  value       = data.terraform_remote_state.vpc.outputs.public_subnet1_id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet created in availability zone 2"
  value       = data.terraform_remote_state.vpc.outputs.public_subnet2_id
}

output "public_zone1" {
  description = "The availability zone of the first public subnet"
  value       = data.terraform_remote_state.vpc.outputs.public_zone1
}

output "public_zone2" {
  description = "The availability zone of the second public subnet"
  value       = data.terraform_remote_state.vpc.outputs.public_zone2
}

# output "eks_cluster" {
#   description = "The name of the EKS cluster"
#   value       = module.eks.eks_cluster
# }

output "eks_cluster_id" {
  description = "The name of the EKS cluster"
  value       = module.eks.eks_cluster.id
}

output "cluster_security_group_id" {
  description = "The ID of the security group associated with the EKS cluster"
  value       = module.eks.eks_cluster.vpc_config[0].cluster_security_group_id
}

output "eks_oidc_identity" {
  value = module.eks.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.eks_cluster.name
}

output "eks_node_group_id" {
  description = "The ID of the EKS node group"
  value       = module.eks.eks_node_group_id
}

output "eks_node_group_ami_type" {
  description = "The AMI type used by the EKS node group"
  value       = module.eks.eks_node_group.ami_type
}

output "eks_node_group_instance_types" {
  description = "The instance types used by the EKS node group"
  value       = module.eks.eks_node_group.instance_types
}

output "eks_node_group__name" {
  description = "The name of the EKS node group"
  value       = module.eks.eks_node_group.node_group_name
}
