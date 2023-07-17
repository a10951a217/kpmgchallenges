output "subnet_name" {
  description = "Subnet Name"
  value = azurerm_subnet.subnet.name
}


output "subnet_id" {
  description = "Subnet ID"
  value = azurerm_subnet.subnet.id
}


output "subnet_nsg_name" {
  description = "Subnet NSG Name"
  value = azurerm_network_security_group.subnet_nsg.name
}

output "subnet_nsg_id" {
  description = "Subnet NSG ID"
  value = azurerm_network_security_group.subnet_nsg.id
}
