variable "key_name" {
  description = "The name of the VPN Server SSH key pair"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the VPN server will be deployed"
  type        = string
}

variable "vpn_server_name" {
  description = "The name of the VPN Server name"
  type        = string
  default     = "OpenVpn"
}

variable "vpn_server_ports" {
  description = "List of port numbers for VPN traffic"
  type        = list(number)
  default     = [22, 443, 943, 945, 1194] #[22, 80]  # You can change or extend this list as needed
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "ami_id" {
  description = "The ID of the AMI image"
  type        = string
}
