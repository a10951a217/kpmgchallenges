# Virtual Network, Subnets and Subnet NSG's
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
## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type = string
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)
}





