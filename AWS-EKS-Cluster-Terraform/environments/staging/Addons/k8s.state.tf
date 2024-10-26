data "terraform_remote_state" "cluster" {
  backend = "local"
  config = {
    path = "../EKS-cluster/terraform.tfstate"
  }
}
