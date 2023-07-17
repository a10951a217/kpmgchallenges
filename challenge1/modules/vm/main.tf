data "azurerm_subnet" "subnet" {
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  name = var.subnet_name
}

resource "azurerm_network_interface" "linuxvm_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.vm_ipconfig_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name = var.vm_name
  resource_group_name = var.resource_group_name
  location = var.location
  size = "Standard_DS1_v2"
  admin_username = var.admin_username
  admin_password = random_password.password.result
  disable_password_authentication = false
  network_interface_ids = [ azurerm_network_interface.linuxvm_nic.id ]
  
  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer = "RHEL"
    sku = "83-gen2"
    version = "latest"
  }
}
