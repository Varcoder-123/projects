output "domain_name" {
    value = azurerm_public_ip.vm_pip.fqdn
}