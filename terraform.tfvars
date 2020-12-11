prefix                              ="tpgame-app01"
resource_group_name                 ="rgtpterraform"
location                            ="westeurope"


#App insight
App_Insights                        ="appi-1"
appservice_name                     ="app-1"
app_service_plan_name               ="plan"

#Mysql Common Variables
owner               = "Dhivina mbani"

#MySQL Server
mysql-admin-login    = "dhivina-admin"
mysql-admin-password = "voiciAP@ssw0rd"
mysql-version        = "8.0"
mysql-sku-name       = "B_Gen5_1"
mysql-storage        = "5120"

#Traffic Manager variable
TrafficManager_Profile              ="traf1"    
TrafficManager_Endpoint             ="traf-ep1"    
TrafficManager_Routing_Method       ="Weighted"
TrafficManager_Endpoint_Type        ="azureEndpoints"

#CDN Variable
cdn_profile_name    ="appcdn01"
cdn_sku_profile     ="Standard_Akamai"
cdn_location        ="westeurope"

#Storage account
rg_name             = "rggameapp109"
rg_location         = "france centre"
sa_name             = "satpterraformesgi"
sa_account_tier     = "Standard"
sa_replication_type = "LRS"