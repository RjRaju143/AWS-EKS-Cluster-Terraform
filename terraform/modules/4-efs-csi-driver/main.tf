### TODO
## EFS

resource "aws_efs_file_system" "eks" {
  creation_token = "eks"
 
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true
}
 
resource "aws_efs_mount_target" "zone_a" {
  file_system_id  = aws_efs_file_system.eks.id
  subnet_id       = var.subnet_id_1
  security_groups = [var.cluster_security_group_id]
}
 
resource "aws_efs_mount_target" "zone_b" {
  file_system_id  = aws_efs_file_system.eks.id
  subnet_id       = var.subnet_id_2
  security_groups = [var.cluster_security_group_id]
}
 
data "aws_iam_policy_document" "efs_csi_driver" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
 
    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:efs-csi-controller-sa"]
    }
 
    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "efs_csi_driver" {
  name               = "${var.cluster_name}-efs-csi-driver"
  assume_role_policy = data.aws_iam_policy_document.efs_csi_driver.json
}
 
resource "aws_iam_role_policy_attachment" "efs_csi_driver" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
  role       = aws_iam_role.efs_csi_driver.name
}
 
resource "helm_release" "efs_csi_driver" {
  name       = "aws-efs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"
  chart      = "aws-efs-csi-driver"
  namespace  = "kube-system"
  version    = "3.0.3"
 
  set {
    name  = "controller.serviceAccount.name"
    value = "efs-csi-controller-sa"
  }
 
  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.efs_csi_driver.arn
  }
 
  depends_on = [
    aws_efs_mount_target.zone_a,
    aws_efs_mount_target.zone_b
  ]
}
 
resource "kubernetes_storage_class_v1" "efs" {
  metadata {
    name = "efs"
  }
 
  storage_provisioner = "efs.csi.aws.com"
 
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = aws_efs_file_system.eks.id
    directoryPerms   = "700"
  }
 
  mount_options = ["iam"]
 
  depends_on = [helm_release.efs_csi_driver]
}
 
####################################
 
# Main Terraform file (main.tf)
 
# ... (previous resources remain unchanged)
 
# resource "aws_eks_cluster" "eks" {
#   # ... (configuration remains unchanged)
# }
 
# resource "aws_eks_node_group" "general" {
#   # ... (configuration remains unchanged)
# }
 
# # EFS module
# module "efs" {
#   source = "./efs"
 
#   cluster_name               = aws_eks_cluster.eks.name
#   cluster_oidc_issuer_url    = aws_eks_cluster.eks.identity[0].oidc[0].issuer
#   subnet_id_1                = var.public_zone1
#   subnet_id_2                = var.public_zone2
#   cluster_security_group_id  = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
# }
 
# # Helm provider configuration
# provider "helm" {
#   kubernetes {
#     host                   = aws_eks_cluster.eks.endpoint
#     cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
#     token                  = data.aws_eks_cluster_auth.eks.token
#   }
# }
 
# # Kubernetes provider configuration
# provider "kubernetes" {
#   host                   = aws_eks_cluster.eks.endpoint
#   cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.eks.token
# }
 