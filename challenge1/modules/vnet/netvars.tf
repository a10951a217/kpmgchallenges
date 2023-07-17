variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}


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





