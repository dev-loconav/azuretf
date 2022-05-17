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
environment_name = "env1"

vm_clusters = {
  "k8s_masters" = {
    cluster_name   = "k8s_masters"
    instance_count = 3
        allocation_method = "dynamic"
    virtual_machine_size  = "Standard_B1s"
	admin_username = "azuser"
	admin_password = "1qaz!QAZ1qaz"
	os_disk_caching = "ReadWrite"
	os_disk_storage_account_type = "StandardSSD_LRS"
	os_disk_size_gb = 32
	publisher	= "Canonical"
	offer		= "UbuntuServer"
	sku		= "16.04-LTS"
	vm_image_version = "latest"
	managed_disk_size_gb = 32
   
  }
}
	
