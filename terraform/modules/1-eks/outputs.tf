output "eks_cluster_id" {
  value = aws_eks_cluster.eks.id
}

output "eks_node_group_id" {
  value = aws_eks_node_group.general.id
}

