# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

# Azure Resources Location
variable "location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

variable "vnet_name" {
  description = "Virtual Network name"
  type = string
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)
}
# Web Subnet Name
variable "subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = list(string)
}
# Web Subnet Address Space
variable "subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
}

variable "inbound_ports_map" {
  description = "Inbound Ports"
  type = list(map(string))
}

variable "nic_name" {
  description = "VM nic name"
  type = list(string)
}

variable "vm_ipconfig_name" {
  description = "VM ipconfig name"
  type = list(string)
}


variable "vm_name" {
  description = "VM name"
  type = list(string)
}

variable "admin_username" {
  description = "VM admin username"
  type = list(string)
}
/*
variable "admin_password" {
  description = "VM admin password"
  type = list(string)
}
*/

variable "lbpublicip_name" {
  description = "lb public ip name"
  type = string
}


variable "lb_name" {
  description = "lb name"
  type = string
}


variable "backend_pool_name" {
  description = "backend pool name"
  type = string
}





