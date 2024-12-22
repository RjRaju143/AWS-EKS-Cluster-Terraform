provider "aws" {
  region = local.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }

  required_version = ">= 1.0.0"

  backend "s3" {
    bucket                  = "stateofterraform"
    key                     = "vpc/public/terraform.tfstate"
    region                  = "ap-south-1"
  }
}
