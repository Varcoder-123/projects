# resource "azurerm_network_interface" "app_nic" {

#   name                = "app-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {

#     name = "internal" #This is the label for the IP configuration

#     subnet_id = azurerm_subnet.app_subnet.id

#     private_ip_address_allocation = "Dynamic"

#     public_ip_address_id = azurerm_public_ip.vm_pip.id
#   }
# }