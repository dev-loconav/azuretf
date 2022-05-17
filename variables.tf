#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Service Principal Variables

variable "client_id" {
    description =   "Client ID (APP ID) of the application"
    type        =   string
}

variable "client_secret" {
    description =   "Client Secret (Password) of the application"
    type        =   string
}

variable "subscription_id" {
    description =   "Subscription ID"
    type        =   string
}

variable "tenant_id" {
    description =   "Tenant ID"
    type        =   string
}
variable "resource_group_name" {
    description =   "Name of the resource group"
    type        =   string

}

variable "location" {
    description =   "Location of the resource group"
    type        =   string
    default     =   "East US"
}

variable "virtual_network_name" {
    description =   "Name of the virtual network"
    type        =   string

}

variable "vnet_address_range" {
    description =   "IP Range of the virtual network"
    type        =   string

}

variable "subnet" {
    description     =       "Create multiple subnets"
    type            =       map(string)

}
variable "tags" {
    description =   "Resouce tags"
    type        =   map(string)
}

variable "environment_name" {
    description =   "name of the env"
    type        =   string

}

variable "vm_clusters" {
  type = map(object({
    // cl_name      = string
    allocation_method = string
    instance_count    = number
    virtual_machine_size  = string
	admin_username = string
	admin_password = string
	os_disk_caching = string
	os_disk_storage_account_type = string
	os_disk_size_gb = number
	publisher	= string
	offer		= string
	 sku		= string
	vm_image_version = string
	  p1	= string
	  p2	= string
	 ma_disk_size_gb = number
       tags          = map(string)
  }))
}

