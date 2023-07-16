variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "location" {
  description = "Region in which Azure Resources to be created"
  type = string
}

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

variable "vm_nic" {
  description = "VM nic name"
  type = string
}
