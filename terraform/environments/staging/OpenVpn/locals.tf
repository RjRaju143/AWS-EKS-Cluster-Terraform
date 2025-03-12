locals {
  region           = "ap-south-1"
  vpn_server_name  = "openvpn"
  key_name         = "ap-south-1"
  vpc_id           = "vpc-0343a219a1ec162e4"
  subnet_id        = "subnet-003fb305e504655c3" # Public Subnet ID
  ami_id           = "ami-01614d815cf856337"
  vpn_server_ports = [22, 443, 943, 945, 1194]
}
