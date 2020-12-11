#Provider
provider "azurerm" {
  use_msi = true
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

#Resoure group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-${var.resource_group_name}"
  location = var.location
}