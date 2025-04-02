output "OpenVpn_eip" {
  value = try(module.OpenVpn.eip.public_ip, null)
}

output "OpenVpn_security_group_id" {
  value = module.OpenVpn.security_group.id
}

output "OpenVpn_instance_id" {
  value = module.OpenVpn.instance.id
}

output "OpenVpn_public_ip" {
  value = module.OpenVpn.instance.public_ip
}

output "OpenVPN_private_ip" {
  value = module.OpenVpn.instance.private_ip
}

output "OpenVPN_instance_type" {
  value = module.OpenVpn.instance.instance_type
}

output "OpenVPN_availability_zone" {
  value = module.OpenVpn.instance.availability_zone
}
