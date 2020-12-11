#Provider
provider "azurerm" {
  use_msi = true
  subscription_id = "f5e16c5a-309d-4f6e-a1d4-9f2b6bbc5998"
  client_id       = "8f458b99-b855-49de-b60c-e1d99f48cfc3"
  client_secret   = "RfTZ6RQ3uiwm9NtBIUgbrGOC.3GZsiTSHJ"
  tenant_id       = "cd5ca3b1-7311-4b62-96da-ebdb7c44ffd5"
  features {}
}

#Resoure group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-${var.resource_group_name}"
  location = var.location
}

#Storage account
resource "azurerm_storage_account" "storage_account" {
  name                          = var.sa_name
  resource_group_name           = azurerm_resource_group.resource_group.name
  location                      = azurerm_resource_group.resource_group.location
  account_tier                  = var.sa_account_tier
  account_replication_type      = var.sa_replication_type
}