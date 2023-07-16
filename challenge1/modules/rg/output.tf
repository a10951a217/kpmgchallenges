output "resource_group_name" {
    value = azurerm_resource_group.resource_group.name
    description = "Name of the resource group."
}

output "location_id" {
    value = azurerm_resource_group.resource_group.location
    description = "Location id of the resource group"
}