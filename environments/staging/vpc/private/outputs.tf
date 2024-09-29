output "aws_region" {
  description = "The AWS region where resources are created"
  value       = local.region
}

output "vpc_id" {
  description = "The ID of the main VPC created by the VPC module"
  value       = module.vpc.vpc_main.id
}

output "vpc_name" {
  description = "The name tag of the VPC created by the VPC module"
  value       = module.vpc.vpc_main.tags["Name"]
}

output "aws_internet_gateway" {
  description = "The ID of the Internet Gateway created by the VPC module"
  value       = module.vpc.aws_internet_gateway.id
}

output "public_subnet1_id" {
  description = "The ID of the first public subnet created in availability zone 1"
  value       = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
  description = "The ID of the second public subnet created in availability zone 2"
  value       = module.vpc.public_subnet2_id
}

output "private_subnet1_id" {
  description = "The ID of the first private subnet created in availability zone 1"
  value       = module.vpc.private_subnet1_id
}

output "private_subnet2_id" {
  description = "The ID of the second private subnet created in availability zone 2"
  value       = module.vpc.private_subnet2_id
}

output "public_zone1" {
  description = "The availability zone of the first public subnet"
  value       = module.vpc.public_zone1.availability_zone
}

output "public_zone2" {
  description = "The availability zone of the second public subnet"
  value       = module.vpc.public_zone2.availability_zone
}

