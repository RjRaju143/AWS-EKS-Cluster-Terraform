data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/public/terraform.tfstate"
  }
}

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
}
