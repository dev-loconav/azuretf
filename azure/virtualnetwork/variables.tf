#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*  Create a Virtual Network in Azure - Variables    *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#


# Resource Group Variables

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
