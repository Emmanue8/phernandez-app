prefix                              ="phernandez"
resource_group_name                 ="rg"
resource_location                   ="northeurope"

# Networking variable assignment starts here
VirtualNetwork                      ="inet"
VirtualNetwork_AddressSpace         =["172.16.194.0/23"] # 512 addresses

# Add two subnet addressess for the inet

Subnet_Addresses                    =[
                                        {
                                            ip      = "172.16.194.0/24"
                                            name     = "inet1"
                                        },
                                        {
                                            ip      = "172.16.195.0/24"
                                            name     = "inet2"
                                        }
                                    ]

# Traffic Manager variable assignment starts here
TrafficManager_Profile              ="traf1"    
TrafficManager_Endpoint             ="traf-ep1"    
TrafficManager_Routing_Method       ="Weighted" # other values are Performance,Priority,Geographic
TrafficManager_Endpoint_Type        ="azureEndpoints"
