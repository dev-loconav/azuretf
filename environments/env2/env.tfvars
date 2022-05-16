resource_group_name = "environment2"
location  = "East US"
virtual_network_name  = "environment2-vnet"
vnet_address_range  = "10.3.0.0/16"
subnet =    {
        "Web-Subnet"    =       "10.3.0.0/24"
        "App-Subnet"    =       "10.3.1.0/24"
        "DB-Subnet"     =       "10.3.2.0/24"
    }
tags  =         {
        "Env"        =   "environment2"
}
