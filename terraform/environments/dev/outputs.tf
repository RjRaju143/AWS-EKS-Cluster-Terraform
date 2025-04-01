# ## VPC
output "vpn_id" {
  value = module.vpc.vpc[0].vpc_main.id
}

output "public_subnet_id1" {
  value = try(module.vpc.vpc[0].public_subnet1_id, null)
}

output "public_subnet_id2" {
  value = try(module.vpc.vpc[0].public_subnet2_id, null)
}

output "private_subnet_id1" {
  value = try(module.vpc.vpc[0].private_subnet2_id, null)
}

output "private_subnet_id2" {
  value = try(module.vpc.vpc[0].private_subnet2_id, null)
}


#### OpenVPN
output "OpenVpn_eip" {
  value = try(module.OpenVpn.eip.public_ip, null)
}

output "OpenVpn_security_group_id" {
  value = module.OpenVpn.security_group.id
}

output "OpenVpn_instance_id" {
  value = module.OpenVpn.instance.id
}

output "OpenVpn_public_ip" {
  value = module.OpenVpn.instance.public_ip
}

output "OpenVPN_private_ip" {
  value = module.OpenVpn.instance.private_ip
}

output "OpenVPN_instance_type" {
  value = module.OpenVpn.instance.instance_type
}

output "OpenVPN_availability_zone" {
  value = module.OpenVpn.instance.availability_zone
}

### EKS
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
  value       = module.eks_cluster.eks_node_group.instance_types[0]
}

output "eks_node_group__name" {
  description = "The name of the EKS node group"
  value       = module.eks_cluster.eks_node_group.node_group_name
}

