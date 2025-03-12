output "vpc_main" {
  description = "The name of the VPC"
  value       = aws_vpc.main
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet in Zone 1"
  value       = aws_subnet.public_zone1.id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet in Zone 2"
  value       = aws_subnet.public_zone2.id
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet in Zone 1"
  value       = aws_subnet.private_zone1.id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet in Zone 2"
  value       = aws_subnet.private_zone2.id
}

output "aws_internet_gateway" {
  description = "The resource object of the Internet Gateway"
  value       = aws_internet_gateway.igw
}

output "public_zone1" {
  description = "The resource object of the public subnet in Zone 1"
  value       = aws_subnet.public_zone1
}

output "public_zone2" {
  description = "The resource object of the public subnet in Zone 2"
  value       = aws_subnet.public_zone2
}
