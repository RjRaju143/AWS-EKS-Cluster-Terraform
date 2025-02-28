locals {
  region           = "ap-south-1"
  vpn_server_name  = "openvpn"
  key_name         = "ap-south-1"
  vpc_id           = "vpc-0080196903010a6cc"
  subnet_id        = "subnet-02fc8d774133dbdbe" # Public Subnet ID
  ami_id           = "ami-00bb6a80f01f03502"
  vpn_server_ports = [22, 443, 943, 945, 1194]
}
