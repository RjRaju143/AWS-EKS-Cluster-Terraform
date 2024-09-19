output "eks_cluster_id" {
  value = aws_eks_cluster.eks.id
}

output "eks_node_group_id" {
  value = aws_eks_node_group.general.id
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "eks_oidc_identity" {
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}



# identity[0].oidc[0].issuer
  # cluster_oidc_issuer_url    = aws_eks_cluster.eks.identity[0].oidc[0].issuer
# 