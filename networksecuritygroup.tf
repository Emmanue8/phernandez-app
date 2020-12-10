resource "azurerm_resource_group" "nsg" {
    name = "${var.name}"
    location = "${var.location}"
}

resource "azurerm_network_security_group" "test" {
    name = "acceptanceTestSecurityGroup1"
    location = "northeurope"
    resource_group_name = "${resource_group_name}"

    security_rule {
    	name = "phnsg"
    	priority = 100
    	direction = "Inbound"
    	access = "Allow"
    	protocol = "Tcp"
    	source_port_range = "*"
    	destination_port_range = "*"
    	source_address_prefix = "*"
    	destination_address_prefix = "*"
    }
    
    tags {
        environment = "Production"
    }
}