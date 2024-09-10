provider "aws" {
  # region = "ap-south-1" # or your preferred region
  region = local.region # or your preferred region
}

terraform {
  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
}

# /// helm-provider for eks cluster
# data "aws_eks_cluster" "eks" {
#   #   name = aws_eks_cluster.eks.name
#   name = local.cluster_name
# }

# data "aws_eks_cluster_auth" "eks" {
#   #   name = aws_eks_cluster.eks.name
#   name = local.cluster_name
# }

# provider "helm" {
#   kubernetes {
#     host                   = data.aws_eks_cluster.eks.endpoint
#     cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
#     token                  = data.aws_eks_cluster_auth.eks.token
#   }
# }

