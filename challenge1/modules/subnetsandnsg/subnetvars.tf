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

variable "subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
}

variable "subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
}

variable "inbound_ports_map" {
  description = "Inbound Ports"
  type = map(string)
}