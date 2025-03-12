output "aws_region" {
  description = "The AWS region where resources are created"
  value       = local.region
}

output "vpn_instance_id" {
  value = module.OpenVpn.instance.id
}

output "public_ip" {
  value = module.OpenVpn.instance.public_ip
}

output "private_ip" {
  value = module.OpenVpn.instance.private_ip
}

output "instance_type" {
  value = module.OpenVpn.instance.instance_type
}

output "availability_zone" {
  value = module.OpenVpn.instance.availability_zone
}

output "eip" {
  value = module.OpenVpn.eip.public_ip
}
