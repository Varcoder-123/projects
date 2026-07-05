# resource "azurerm_linux_virtual_machine" "vm" {

#   name                = "java-app-vm"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location

#   size = "Standard_B2ls_v2"

#   admin_username = "azureuser"
  
#   admin_password = var.vm_password

#   disable_password_authentication = false

#   network_interface_ids = [
#     azurerm_network_interface.app_nic.id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Premium_LRS"
#   }

#   source_image_reference {

#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }