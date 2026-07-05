resource "azurerm_network_security_group" "app_nsg" {
  name                = var.app_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

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


}

resource "azurerm_network_security_rule" "rules" {

  for_each = {
    for rule in var.security_rules : rule.name => rule
  }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol

  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range

  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

# #NSG is attached to the subnet rather than the nic level becaue of the scalability and centralized governance. 
