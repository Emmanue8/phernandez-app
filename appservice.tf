resource "azurerm_app_service" "appservice" {
name                    ="${var.prefix}-${var.appservice_name}"
location                =azurerm_resource_group.resource_group.location
resource_group_name     =azurerm_resource_group.resource_group.name
app_service_plan_id     = azurerm_app_service_plan.appserviceplan1.id
https_only              = true


        site_config {
                        linux_fx_version = "NODE|10.14"
                    }
  
    app_settings =  {
                        "SOME_KEY" = "some-value"
                        "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appService-app_insights.instrumentation_key
                        "APPINSIGHTS_PROFILERFEATURE_VERSION" = "1.0.0"
                        "DIAGNOSTICS_AZUREBLOBRETENTIONINDAYS" = "35"
                        "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "35"
                        # Enable the following settings to map the app insights to the App service
                        "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
                        "XDT_MicrosoftApplicationInsights_Mode"= "recommended"
                        "APPINSIGHTS_PROFILERFEATURE_VERSION" = "1.0.0"
                        "DiagnosticServices_EXTENSION_VERSION" = "~3"
                        "APPINSIGHTS_SNAPSHOTFEATURE_VERSION" = "1.0.0"
                        "SnapshotDebugger_EXTENSION_VERSION" = "~1"
                        "InstrumentationEngine_EXTENSION_VERSION" = "~1"
                        "XDT_MicrosoftApplicationInsights_BaseExtensions" = "~1"
                    }

connection_string   {
                        name  = "Database"
                        type  = "SQLServer"
                        value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
                    }


depends_on        = [
                        azurerm_app_service_plan.appserviceplan1,
                        azurerm_application_insights.appService-app_insights
                    ]       
}


# AppService Plan
resource "azurerm_app_service_plan" "appserviceplan1" {
  
  name                      ="${var.prefix}-${var.app_service_plan_name}"
  location                  =azurerm_resource_group.resource_group.location
  resource_group_name       =azurerm_resource_group.resource_group.name
  kind                      ="linux"
  reserved                  = true
  sku                 {
                        tier = "Standard" # 
                        size = "S1"
                    }
     
}

# App Service Autoscale settings
resource "azurerm_monitor_autoscale_setting" "appserviceplan1_autoscale" {
  name                      ="{var.prefix}-{var.AppService1_AutoscaleSetting}"
  location                  =azurerm_resource_group.resource_group.location
  resource_group_name       =azurerm_resource_group.resource_group.name
   target_resource_id       =azurerm_app_service_plan.appserviceplan1.id
   profile {
                name = "defaultProfile"

                capacity {
                            default = 2
                            minimum = 2
                            maximum = 4
                        }
    }
}    