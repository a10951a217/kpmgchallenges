terraform {
    
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.5"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.5"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  # Configuration options
}


module "resource_group" {
   source = "./modules/rg"
   resource_group_name = var.resource_group_name
   location = var.location
}

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "./modules/vnet"
  resource_group_name = var.resource_group_name
  location = var.location
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
}



module "subnet_and_nsg" {
  depends_on = [ module.virtual_network ]
  source = "./modules/subnetsandnsg"
  resource_group_name = var.resource_group_name
  location = var.location
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space

  for_each =  toset(var.subnet_name)

  subnet_name = each.key
  subnet_address = [var.subnet_address[index(tolist(var.subnet_name), each.key)]]
  inbound_ports_map = var.inbound_ports_map[index(tolist(var.subnet_name), each.key)]

}

module "linuxvm" {
  depends_on = [ module.subnet_and_nsg ]
  source = "./modules/vm"
  resource_group_name = var.resource_group_name
  location = var.location
  vnet_name = var.vnet_name
  for_each = toset(var.vm_name)
  nic_name = var.nic_name[index(tolist(var.vm_name), each.key)]
  vm_name = each.key
  vm_ipconfig_name = var.vm_ipconfig_name[index(tolist(var.vm_name), each.key)]
  admin_username = var.admin_username[index(tolist(var.vm_name), each.key)]
  subnet_name = var.subnet_name[index(tolist(var.vm_name), each.key)]
}

module "lb" {
  depends_on = [ module.linuxvm ]
  source = "./modules/lb"
  resource_group_name = var.resource_group_name
  location = var.location
  lbpublicip_name =  var.lbpublicip_name
  lb_name = var.lb_name
  backend_pool_name = var.backend_pool_name
  vm_nic = var.nic_name[0]
}