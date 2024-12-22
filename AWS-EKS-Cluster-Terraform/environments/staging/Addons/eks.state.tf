### local state
# data "terraform_remote_state" "cluster" {
#   backend = "local"
#   config = {
#     path = "../EKS-cluster/terraform.tfstate"
#   }
# }

### s3 state
data "terraform_remote_state" "cluster" {
  backend = "s3"
  config = {
    bucket = "stateofterraform"
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}

