### pod_identity addon
resource "aws_eks_addon" "pod_identity" {
  cluster_name  = var.cluster_name
  # addon_name    = "eks-pod-identity-agent"
  addon_name    = var.addon_name
  # addon_version = "v1.3.0-eksbuild.1"
  addon_version = var.addon_version
}



