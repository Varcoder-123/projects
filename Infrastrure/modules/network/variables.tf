variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "app_subnet_name" {
  type = string
}

variable "app_subnet_prefix" {
  type = list(string)
}

variable "db_subnet_name" {
  type = string
}

variable "db_subnet_prefix" {
  type = list(string)
}

variable "nat_public_ip_name" {
  type = string
}

variable "nat_gateway_name" {
  type = string
}