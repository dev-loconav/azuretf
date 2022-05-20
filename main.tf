#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#
#*                 Root Module                         *#
#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#

# Terraform Block

terraform {
    required_providers  {
        azurerm =   {
            source  =   "hashicorp/azurerm"
        }
    }
    backend "azurerm" {}
}

# Provider Block

provider "azurerm" {
    version         =   "3.6.0"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    
    features {}
}




provider "azuread" {
    version         =   ">= 0.11"
    client_id       =   var.client_id
    client_secret   =   var.client_secret
    tenant_id       =   var.tenant_id
    alias           =   "ad"
}


// module "windows-server" {
//     source  =   "./azure/WindowsServer2019"
// }

// module "winvm" {
//     source =    "./azure/Windows10-ExistingInfra"
// }



// module "aks" {
//     source    =     "./azure/aks"
//     env       =     "dev"
// }



// module "customrole" {
//     source  =   "./azure/custom-roles"
// }

// module "provisioners" {
//     source  =   "./azure/provisioners-example"
// }

// module "linuxvm" {
//     source  =   "./azure/linuxVM"
//     for_each = var.vm_clusters
// }
module "vnet" {
    source  =   "./azure/virtualnetwork"
    resource_group_name = var.resource_group_name
    location  = var.location
    virtual_network_name  = var.virtual_network_name
    vnet_address_range  = var.vnet_address_range
    subnet = var.subnet
    tags  = var.tags
}

 module "vm" {
  source = "./azure/linuxVM-Existing-RG-Vnet/"

      resource_group_name = var.resource_group_name
    location  = var.location
    virtual_network_name  = var.virtual_network_name  
    tags = var.tags

  for_each = var.vm_clusters
    
  
  allocation_method  = each.value.allocation_method
    instance_count = each.value.instance_count
  virtual_machine_size  = each.value.virtual_machine_size
  admin_username  = each.value.admin_username
  admin_password  = each.value.admin_password
  os_disk_caching = each.value.os_disk_caching
  os_disk_storage_account_type = each.value.os_disk_storage_account_type
  os_disk_size_gb = each.value.os_disk_size_gb
  publisher = each.value.publisher
  offer = each.value.offer
   sku = each.value.sku
  vm_image_version = each.value.vm_image_version  
   managed_disk_size_gb = each.value.managed_disk_size_gb
   cluster_name = each.value.cluster_name  
}
 
/*
  locals {
  availability_zones = flatten([for i in module.ec2 : i.availability_zone])
  instance_ids       = flatten([for i in module.ec2 : i.id])
  private_ips        = flatten([for i in module.ec2 : i.private_ip])
  ec2_names          = flatten([for i in module.ec2 : i.tags])
  ec2_name_tag       = flatten([for i in local.ec2_names : i.Name])
}

*/
