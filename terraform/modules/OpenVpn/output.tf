output "instance" {
  value = aws_instance.vpn_server
}

output "eip" {
  value = aws_eip.vpn_server_eip
}

output "security_group" {
  value = aws_security_group.vpn_security_group
}
