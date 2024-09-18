locals {
  cluster_name          = "dev-cluster"
}

module "ebs-csi-driver" {
  source = "../../../modules/3-ebs-csi-driver"
  
  cluster_name = local.cluster_name
}
