output "instance" {
  value = aws_instance.vpn_server
}

output "eip" {
  value = aws_eip.vpn_server_eip
}
