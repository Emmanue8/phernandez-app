# Create a MySQL Server
resource "azurerm_mysql_server" "mysql-server" {
  name                  = "mysqlgameappdbserver"
  location              = azurerm_resource_group.resource_group.location
  resource_group_name   = azurerm_resource_group.resource_group.name
 
  administrator_login          = var.mysql-admin-login
  administrator_login_password = var.mysql-admin-password
 
  sku_name = var.mysql-sku-name
  version  = var.mysql-version
 
  storage_mb        = var.mysql-storage
  auto_grow_enabled = true
  
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

# Create a MySQL Database
resource "azurerm_mysql_database" "mysql-db" {
  name                = "dhivinadb"
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_mysql_server.mysql-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


resource "azurerm_mysql_firewall_rule" "mysql-rg" {
  name                = "mysql_firewall"
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_mysql_server.mysql-server.name
  start_ip_address    =  var.start_ip_address
  end_ip_address      =  var.end_ip_address
}