variable "prefix" {
    description     = "Sets prefix"
    type            = string
}


resource "random_string" "random" {
  length = 16
  special = true
  override_special = "/@£$"
}


#Ressource group
variable "resource_group_name" {
  description       = "ressrouce group name"
  type              = string
}

variable "location" {
  description       = "Default location for all the resources"
  type              = string
}

#Storage account
variable "rg_name" {
}
variable "rg_location" {
  type    = string
  default = "West Europe"
}
variable "sa_name" {
  type        = string
  description = "Storage account name"
}
variable "sa_account_tier" {
  type = string
}
variable "sa_replication_type" {
  type = string
}


#App Insight
variable "App_Insights" {
  description       = "app insights"
  type              = string
}
variable "appservice_name" {
  description       = "gameapp service"
  type              = string
}
variable "app_service_plan_name" {
    description       = "gameapp plan"
    type              = string
}


#Traffic Manager
variable "TrafficManager_Profile" {
    description       = "gameapp Traffic Manger Profile"
    type              = string
}
variable "TrafficManager_Routing_Method" {
    description       = "gameapp Traffic Manger Routing Method"
    type              = string
}
variable "TrafficManager_Endpoint" {
    description       = "gameapp Traffic Manger Endpoint"
    type              = string
}
variable "TrafficManager_Endpoint_Type" {
    description       = "Type of the Traffic Manger Endpoint"
    type              = string
}


#CDN
variable "cdn_profile_name" {
  description = "Specifies the name of the CDN Profile"
  default     = ""
}
variable "cdn_sku_profile" {
  description = "The pricing related information of current CDN profile. Accepted values are 'Standard_Akamai', 'Standard_ChinaCdn', 'Standard_Microsoft', 'Standard_Verizon' or 'Premium_Verizon'."
  default     = "Standard_Akamai"
}
variable "cdn_location" {
    description     = "cdn location"
    type            = string
    default         = "westeurope"     
}

#MySQL Variables
variable "mysql-admin-login" {
  type        = string
  description = "Login to authenticate to MySQL Server"
}
variable "mysql-admin-password" {
  type        = string
  description = "Password to authenticate to MySQL Server"
}
variable "mysql-version" {
  type        = string
  description = "MySQL Server version to deploy"
  default     = "8.0"
}
variable "mysql-sku-name" {
  type        = string
  description = "MySQL SKU Name"
  default     = "B_Gen5_1"
}
variable "mysql-storage" {
  type        = string
  description = "MySQL Storage in MB, from 5120 MB to 4194304 MB"
  default     = "5120"
}
variable "owner" {
  type        = string
  description = "MySQL DB owner"
  default     = ""
}


#The Azure feature Allow access to Azure services can be enabled 
#by setting start_ip_address and end_ip_address to 0.0.0.0 which
# is documented in the Azure API Docs.
variable "start_ip_address" {
  default     = "0.0.0.0"
  description = "Specifies the Start IP Address associated with this Firewall Rule. Changing this forces a new resource to be created."
}
variable "end_ip_address" {
  default     = "0.0.0.0"
  description = "Specifies the End IP Address associated with this Firewall Rule. Changing this forces a new resource to be created."
}
variable "firewall_rule_name" {
  default     = "AllowAllAzureIPs"
  description = "Specifies the name of the MySQL Firewall Rule. Changing this forces a new resource to be created."
}