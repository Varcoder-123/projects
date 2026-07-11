resource "azurerm_resource_group" "backend_rg" {
  name     = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

resource "azurerm_storage_account" "backend_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  allow_nested_items_to_be_public = false

  tags = {
    Purpose = "Terraform Backend"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backend_storage.id
  container_access_type = "private"
}