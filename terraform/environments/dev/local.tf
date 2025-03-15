locals {
  region = "ap-south-1"
  #### VPC
  is_private           = true # Change to false if you want a public VPC Default is false (public VPC)
  name                 = "dev-main"
  cidr_block           = "10.0.0.0/16"
  public_subnet1_cidr  = "10.0.64.0/19"
  public_subnet2_cidr  = "10.0.96.0/19"
  private_subnet1_cidr = "10.0.0.0/19"
  private_subnet2_cidr = "10.0.32.0/19"
  zone1                = "ap-south-1a"
  zone2                = "ap-south-1b"
  cluster_name         = "dev-cluster"
  igw_cidr             = "0.0.0.0/0"
  nat_cidr             = "0.0.0.0/0"

  ### OpenVPN
  vpn_server_name  = "OpenVPN"
  key_name         = "ap-south-1"
  ami_id           = "ami-01614d815cf856337"
  vpn_server_ports = [22, 443, 943, 945, 1194]

  ### EKS
  environment             = "dev"
  cluster_version         = "1.32" # or your preferred EKS version
  endpoint_private_access = true
  endpoint_public_access  = false
  desired_size            = 1
  max_size                = 5
  min_size                = 1
  instance_types          = ["t3.medium"]
  node_group_name         = "dev-cluster-general"
}
