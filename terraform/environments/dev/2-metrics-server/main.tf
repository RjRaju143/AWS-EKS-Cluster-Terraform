locals {
  region                = "ap-south-1"
  cluster_name          = "dev-cluster"
}

module "metrix_server" {
  source = "../../../modules/2-metrics-server"

  cluster_name = local.cluster_name
  awsRegion = local.region
}
