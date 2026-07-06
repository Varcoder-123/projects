resource "azurerm_network_interface" "app_nic" {
  name                = var.app_nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {

    name = "internal" #This is the label for the IP configuration

    subnet_id = var.app_subnet_id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = var.public_subnet_id
  }
}

