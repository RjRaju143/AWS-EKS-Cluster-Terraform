# output "vpc" {
#   description = "The ID of the created VPC"
#   value       = var.is_private ? module.private : module.public
# }

output "vpc" {
  description = "The ID of the created VPC"
  value       = var.is_private ? module.private : module.public
}

