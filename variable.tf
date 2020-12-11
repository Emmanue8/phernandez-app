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