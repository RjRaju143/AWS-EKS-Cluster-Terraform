module "OpenVpn" {
  source           = "../../../modules/OpenVpn"
  vpc_id           = local.vpc_id          #"vpc-0aaf65c19284fa30e" #module.vpc.vpc_main.id
  subnet_id        = local.subnet_id       #"subnet-0d097a2dcf4c876e3" #module.vpc.public_zone1.id
  vpn_server_name  = local.vpn_server_name #"openVpn" #local.vpn_name
  vpn_server_ports = local.vpn_server_ports
  ami_id           = local.ami_id
  key_name         = "staging-cluster" # Name of the key pair to be used for SSH access
}