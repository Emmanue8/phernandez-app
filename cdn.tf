#Create a CDN
resource "azurerm_cdn_profile" "cdnprofile" {
  name                = var.cdn_profile_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = var.cdn_sku_profile
}

resource "azurerm_cdn_endpoint" "cdn-endpoint" {
  name                          = "gameappcdn"
  profile_name                  = var.cdn_profile_name
  location                      = "westeurope"
  resource_group_name           = azurerm_resource_group.resource_group.name

  origin {
    name      = "gameappcdn"
    host_name = "www.gameapp.com"
  }
}