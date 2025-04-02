# ## VPC
output "vpc_id" {
  value = module.vpc.vpc[0].vpc_main.id
}

output "public_subnet_id1" {
  value = try(module.vpc.vpc[0].public_subnet1_id, null)
}

output "public_subnet_id2" {
  value = try(module.vpc.vpc[0].public_subnet2_id, null)
}

output "private_subnet_id1" {
  value = try(module.vpc.vpc[0].private_subnet1_id, null)
}

output "private_subnet_id2" {
  value = try(module.vpc.vpc[0].private_subnet2_id, null)
}
