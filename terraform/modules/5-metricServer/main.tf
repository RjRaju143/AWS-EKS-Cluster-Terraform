###  metrics_server
resource "helm_release" "metrics_server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = "3.12.1"

  values = [file("${path.module}/values/metrics-server.yaml")]

  #   depends_on = [aws_eks_node_group.general]
}

### pod_identity addon
resource "aws_eks_addon" "pod_identity" {
  #   cluster_name  = aws_eks_cluster.eks.name
  cluster_name  = var.cluster_name
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.3.0-eksbuild.1"
}




