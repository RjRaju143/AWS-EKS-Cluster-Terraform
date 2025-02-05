provider "aws" {
  region     = "ap-south-1"
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
    region                  = "ap-south-1"
    bucket                  = "stateofterraform"
    key                     = "VPC/terraform.tfstate"
  }
}

