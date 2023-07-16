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
