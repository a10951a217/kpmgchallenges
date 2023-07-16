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

variable "subnet_name" {
  description = "VM subnet name"
  type = string
}

variable "vnet_name" {
  description = "Vnet name"
  type = string
}

variable "nic_name" {
  description = "VM nic name"
  type = string
}

variable "vm_ipconfig_name" {
  description = "VM ipconfig name"
  type = string
}


variable "vm_name" {
  description = "VM name"
  type = string
}

variable "admin_username" {
  description = "VM admin username"
  type = string
}
/*
variable "admin_password" {
  description = "VM admin password"
  type = string
}
*/
