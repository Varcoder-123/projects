variable "storage_account_name" {
  description = "The name of the storage account to be created for the Terraform backend."
  type        = string
}

variable "container_name" {
  description = "The name of the storage container to be created for the Terraform backend."
  type        = string
}