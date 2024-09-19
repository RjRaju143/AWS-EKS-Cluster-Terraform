output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_zone1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_zone2.id
}
