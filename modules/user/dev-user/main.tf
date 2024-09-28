resource "aws_iam_user" "developer" {
  name = var.dev_user_name
  #   name = "developer"
}

resource "aws_iam_policy" "developer_eks" {
  name   = "AmazonEKSDeveloperPolicy"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster",
                "eks:ListClusters"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "developer_eks" {
  user       = aws_iam_user.developer.name
  policy_arn = aws_iam_policy.developer_eks.arn
}

resource "aws_eks_access_entry" "developer" {
  cluster_name      = var.cluster_name
  principal_arn     = aws_iam_user.developer.arn
  kubernetes_groups = var.k8s_dev_groups_name
  #   cluster_name      = aws_eks_cluster.eks.name
  #   kubernetes_groups = ["my-viewer"]
}

##########

## helm-provider for eks cluster
data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

resource "kubernetes_manifest" "viewer-cluster-role" {
  manifest = yamldecode(file("${path.module}/dev-role/0-viewer-cluster-role.yaml"))
}

resource "kubernetes_manifest" "viewer-cluster-role-binding" {
  manifest = yamldecode(file("${path.module}/dev-role/1.viewer-cluster-role-binding.yaml"))
}

