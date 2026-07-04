resource "azurerm_private_dns_zone" "mysql_dns" {
  name                = "mysql.private.mysql.database.azure.com" #Azure by default does't have the static ip address for the mysql server. So we need to create a private dns zone for the mysql server. This is the private dns zone which will be used to resolve the mysql server name to its private ip address.
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql_dns_link" {
  name                  = "mysql-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.mysql_dns.name
  resource_group_name   = azurerm_resource_group.rg.name

  virtual_network_id = azurerm_virtual_network.vnet.id
}

resource "azurerm_mysql_flexible_server" "mysql" { #This is the mysql server where i can create multiple databases for different applications. Here we are creating a single database for our application.
  name                = "vigneshmysqlserver123"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  administrator_login    = "mysqladmin"
  administrator_password = var.mysql_password

  sku_name = "B_Standard_B1ms"

  version = "8.0.21"

  delegated_subnet_id = azurerm_subnet.db_subnet.id

  private_dns_zone_id = azurerm_private_dns_zone.mysql_dns.id

  backup_retention_days = 7

  geo_redundant_backup_enabled = false

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.mysql_dns_link
  ]
}

resource "azurerm_mysql_flexible_database" "appdb" { #This is the database which is created inside the mysql server. Here we are creating a single database for our application. If we have multiple applications then we can create multiple databases inside the same mysql server.

  name      = "ecommercedb"

  server_name = azurerm_mysql_flexible_server.mysql.name

  resource_group_name = azurerm_resource_group.rg.name

  charset   = "utf8"

  collation = "utf8_unicode_ci"
}

output "mysql_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}