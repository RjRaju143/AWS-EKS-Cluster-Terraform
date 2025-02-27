resource "aws_instance" "vpn_server" {
  ami           = var.ami_id
  instance_type = "t2.small"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.vpn_security_group.id]

  tags = {
    Name        = var.vpn_server_name
    Environment = "Development"
  }
}

resource "aws_security_group" "vpn_security_group" {
  name        = "${var.vpn_server_name}-security-group"
  description = "Allow VPN traffic for ${var.vpn_server_name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.vpn_server_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "vpn_server_eip" {
  instance = aws_instance.vpn_server.id
}