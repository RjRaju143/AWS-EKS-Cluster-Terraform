locals {
  region           = "ap-south-1"
  vpn_server_name  = "OpenVpn"
  vpc_id           = "vpc-0ee61e4eb969fb057"
  subnet_id        = "subnet-0cf3d0912c22622c3" # Public Subnet ID
  ami_id           = "ami-01614d815cf856337"
  vpn_server_ports = [22, 443, 943, 945, 1194]
}
