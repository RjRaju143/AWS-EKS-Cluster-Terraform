data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    # path = "../vpc/private/terraform.tfstate"
    path = "../vpc/public/terraform.tfstate"
  }
}
