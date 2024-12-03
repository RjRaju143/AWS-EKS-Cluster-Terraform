provider "aws" {
	region = "ap-south-2"
}

provider "kubernetes" {
	host = data.aws_eks_cluster.cluster.endpoint
	token = data.aws_eks_cluster_auth.cluster.token
	cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
}

data "aws_eks_cluster" "cluster" {
	name = "dev-cluster"
}

data "aws_eks_cluster_auth" "cluster" {
	name = data.aws_eks_cluster.cluster.name
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = <<EOT
- rolearn: arn:aws:iam::654654428184:role/dev-cluster-eks-nodes
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:nodes
EOT
  }
}

