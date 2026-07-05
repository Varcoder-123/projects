# resource "azurerm_virtual_network" "vnet" {
#   name                = "devops-vnet"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   address_space = ["10.0.0.0/16"]
# }

# resource "azurerm_subnet" "public_subnet" {
#   name                 = "public-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name

#   address_prefixes = ["10.0.1.0/24"]
# }

# resource "azurerm_subnet" "app_subnet" {
#   name                 = "app-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name

#   address_prefixes = ["10.0.2.0/24"]
# }

# resource "azurerm_subnet" "db_subnet" {
#   name                 = "db-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name

#   address_prefixes = ["10.0.3.0/24"]

#     delegation {
#     name = "mysql-delegation"

#     service_delegation {
#       name = "Microsoft.DBforMySQL/flexibleServers"

#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action"
#       ]
#     }
#   }  
# }