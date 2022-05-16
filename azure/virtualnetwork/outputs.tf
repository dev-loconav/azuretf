#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*  Create a Virtual Network in Azure - Outputs      *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

output "resource-group-name" {
    description     =   "Print the name of the resource group"
    value           =   azurerm_resource_group.rg.name
}

output "resource-group-location" {
    description     =   "Print the location of the resource group"
    value           =   azurerm_resource_group.rg.location
}

output "virtual-network-name" {
    description     =   "Print the name of the virtual network"
    value           =   azurerm_virtual_network.vnet.name
}

output "virtual-network-ip-range" {
    description     =   "Print the ip range of the virtual network"
    value           =   azurerm_virtual_network.vnet.address_space
}

output "subnet-name" {
    description     =   "Print the name of the subnet"
    value           =   azurerm_subnet.sn.name
}

output "subnet" {
    description =   "Map subnet name with address_prefixes"
    value       =   { for s in azurerm_subnet.sn: s.name => s.address_prefixes }
}
