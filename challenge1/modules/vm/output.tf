output "linuxvm_private_ip_address" {
  description = "Linux Virtual Machine Private IP"
  value = azurerm_linux_virtual_machine.linuxvm.private_ip_address
}

output "linuxvm_name" {
    description = "Linux Virtual Machine Name"
    value  = azurerm_linux_virtual_machine.linuxvm.name
}


output "linuxvm_network_interface_id" {
  description = "Linux VM Network Interface ID"
  value = azurerm_network_interface.linuxvm_nic.id
}

output "linuxvm_nic_ipconfig" {
  description = "Linux VM ip config"
  value = azurerm_network_interface.linuxvm_nic.ip_configuration
}

output "linuxvm_username" {
  description = "linux vm admin username"
  value = azurerm_linux_virtual_machine.linuxvm.admin_username
}

output "linuxvm_password" {
  description = "linux vm admin password"
  value = azurerm_linux_virtual_machine.linuxvm.admin_password
  sensitive = true
}

