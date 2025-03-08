###
data "aws_eks_cluster" "eks" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = local.cluster_name
}

provider "aws" {
  region = local.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.15.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket = "staging-cluter-state"
    key    = "Addons/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

provider "tls" {
  # TLS provider typically does not need additional configuration
}
