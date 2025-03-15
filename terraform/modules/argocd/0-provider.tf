# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/kubeconfig.yaml"
#   }
# }

####################
data "aws_eks_cluster" "eks" {
  name = "cluster-name"
}

data "aws_eks_cluster_auth" "eks" {
  name = "cluster-name"
}

provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

