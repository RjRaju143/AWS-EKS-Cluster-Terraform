output "eks_cluster" {
  value = aws_eks_cluster.eks
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_node_group_id" {
  value = aws_eks_node_group.general.id
}

output "eks_node_group" {
  value = aws_eks_node_group.general
}
