locals {
  region           = "ap-south-1"
  vpn_server_name  = "openvpn"
  key_name         = "ap-south-1"
  vpc_id           = "vpc-0301ab4b6780ecaa3"
  subnet_id        = "subnet-0448d20bfa0e7b6c3" # Public Subnet ID
  ami_id           = "ami-01614d815cf856337"
  vpn_server_ports = [22, 443, 943, 945, 1194]
}
