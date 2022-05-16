resource_group_name = "environment1"
location  = "East US"
virtual_network_name  = "environment1-vnet"
vnet_address_range  = "10.2.0.0/16"
subnet =    {
        "Web-Subnet"    =       "10.2.0.0/24"
        "App-Subnet"    =       "10.2.1.0/24"
        "DB-Subnet"     =       "10.2.2.0/24"
    }
tags  =         {
        "Env"        =   "environment1"
}
