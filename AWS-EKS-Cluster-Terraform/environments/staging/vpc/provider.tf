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

#   backend "s3" {
#     bucket                  = "stateofterraform"
#     key                     = "VPC/terraform.tfstate"
#     region                  = "ap-south-1"
#   }
}

