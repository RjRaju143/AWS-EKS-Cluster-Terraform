locals {
  region           = "ap-south-1"
  vpn_server_name  = "openvpn"
  key_name         = "ap-south-1"
  vpc_id           = "vpc-0c0ae81b97d3b1a75"
  subnet_id        = "subnet-0f12c364faca3f075" # Public Subnet ID
  ami_id           = "ami-01614d815cf856337"
  vpn_server_ports = [22, 443, 943, 945, 1194]
}
