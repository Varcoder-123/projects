vm_password = "Vicky1867@123"
mysql_password = "Mysql@123456"

#network configuration
vnet_name = "dev-vnet"
address_space = ["10.0.0.0/16"]
public_subnet_name = "public-subnet"
public_subnet_prefix = ["10.0.3.0/24"]
app_subnet_name = "app-subnet"
app_subnet_prefix = ["10.0.4.0/24"]
db_subnet_name = "db-subnet"
db_subnet_prefix = ["10.0.5.0/24"]

#NSG configuration
app_nsg_name = "app-nsg"
security_rules = [
  {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "HTTPS"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

#Compute configuration
app_nic_name = "app-nic"
vm_name = "java-app-vm"
vm_size = "Standard_B2ls_v2"
vm_admin_username = "azureuser"
vm_admin_password = "Vicky1867@123"
public_ip_name = "app-public-ip"

#Database configuration
mysql_dns_name = "mysql.private.mysql.database.azure.com"
mysql_dns_link_name = "mysql-dns-link"
mysql_server_name = "vigneshmysqlserver123"
mysql_admin_username = "mysqladmin"
mysql_admin_password = "Mysql@123456"
mysql_database_name = "ecommercedb"

