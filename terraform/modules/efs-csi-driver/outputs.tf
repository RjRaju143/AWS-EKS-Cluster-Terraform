output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_oidc_identity" {
  value = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

