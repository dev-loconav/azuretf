#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
# Create a Linux VM in an existing RG and VNET
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*


data "azurerm_subnet" "web" {
    name                    =    "App-Subnet"
    virtual_network_name    =    var.virtual_network_name
    resource_group_name     =    var.resource_group_name
}


#
# - Public IP (To Login to Linux VM)
#

resource "azurerm_public_ip" "pip" {
    count                             =    var.instance_count
    name                              =   "linuxvm-public-ip${count.index}"
    resource_group_name             =     var.resource_group_name
    location                        =     var.location
    allocation_method               =     var.allocation_method
    tags                            =     var.tags
}

#
# - Create a Network Interface Card for Virtual Machine
#

resource "azurerm_network_interface" "nic" {
    count                             =    var.instance_count
    name                              =   "linuxvm-nic${count.index}"
    resource_group_name               =   var.resource_group_name
    location                          =   var.location
    tags                              =   var.tags
    ip_configuration                  {
        name                          =  "linuxvm-public-ip${count.index}"
        subnet_id                     =   data.azurerm_subnet.web.id
        public_ip_address_id          =   azurerm_public_ip.pip[count.index]
        private_ip_address_allocation =   var.allocation_method
    }
}


#
# - Create a Linux Virtual Machine
# 

resource "azurerm_linux_virtual_machine" "vm" {
    count                             =    var.instance_count
    name                              =   "var.cluster_name${count.index}"
    resource_group_name               =   var.resource_group_name
    location                          =   var.location
    network_interface_ids             =   [azurerm_network_interface.nic[count.index]]
    size                              =   var.virtual_machine_size
    computer_name                     =   "var.cluster_name${count.index}"
    admin_username                    =   var.admin_username
    admin_password                    =   var.admin_password
    disable_password_authentication   =   false

    os_disk  {
        name                          =   "linuxvm-os-disk"
        caching                       =   var.os_disk_caching
        storage_account_type          =   var.os_disk_storage_account_type
        disk_size_gb                  =   var.os_disk_size_gb
    }

    source_image_reference {
        publisher                     =   var.publisher
        offer                         =   var.offer
        sku                           =   var.sku
        version                       =   var.vm_image_version
    }

    tags                              =   var.tags

}

