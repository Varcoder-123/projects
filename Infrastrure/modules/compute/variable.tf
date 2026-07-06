variable "app_nic_name" {
  description = "The name of the application network interface"
  type        = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "app_subnet_id" {
  description = "The ID of the subnet to associate with the network interface"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet to associate with the network interface"
  type        = string
}