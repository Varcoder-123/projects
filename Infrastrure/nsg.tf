# resource "azurerm_network_security_group" "app_nsg" {
#   name                = "app-nsg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   security_rule {
#     name                       = "SSH"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"

#     source_port_range          = "*"
#     destination_port_range     = "22"

#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "APP"
#     priority                   = 110
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"

#     source_port_range          = "*"
#     destination_port_range     = "8080"

#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "HTTP"
#     priority                   = 130
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"

#     source_port_range          = "*"
#     destination_port_range     = "80"

#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_subnet_network_security_group_association" "app_subnet_assoc" {
#   subnet_id = azurerm_subnet.app_subnet.id #subnet .As default subnet has nsg, same here we are attaching nsg for an appsubnet

#   network_security_group_id = azurerm_network_security_group.app_nsg.id #security group
# }

# #NSG is attached to the subnet rather than the nic level becaue of the scalability and centralized governance. 
