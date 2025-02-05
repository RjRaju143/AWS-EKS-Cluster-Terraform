provider "aws" {
  region     = local.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }

  backend "s3" {
    bucket                  = "stateofterraform"
    key                     = "EKS/terraform.tfstate"
    region                  = "ap-south-1"
  }
}
