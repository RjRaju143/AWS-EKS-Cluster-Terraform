### local state
# data "terraform_remote_state" "vpc" {
#   backend = "local"
#   config = {
#     path = "../vpc/public/terraform.tfstate"
#   }
# }

### s3 state
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "stateofterraform"  # Your S3 bucket name
    key    = "vpc/public/terraform.tfstate"  # The path to the state file in your S3 bucket
    region = "ap-south-1"  # The region where the S3 bucket is located
  }
}

