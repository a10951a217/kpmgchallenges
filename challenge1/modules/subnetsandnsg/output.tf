output "subnet_name" {
  description = "Subnet Name"
  value = azurerm_subnet.subnet.name
}

## Subnet ID 
output "subnet_id" {
  description = "Subnet ID"
  value = azurerm_subnet.subnet.id
}

# Network Security Outputs
## Web Subnet NSG Name 
output "subnet_nsg_name" {
  description = "Subnet NSG Name"
  value = azurerm_network_security_group.subnet_nsg.name
}

## Web Subnet NSG ID 
output "subnet_nsg_id" {
  description = "Subnet NSG ID"
  value = azurerm_network_security_group.subnet_nsg.id
}
