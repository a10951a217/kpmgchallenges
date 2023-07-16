# Resource-1: Create Public IP Address for Azure Load Balancer
resource "azurerm_public_ip" "web_lbpublicip" {
  name                = var.lbpublicip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}



# Resource-2: Create Azure Standard Load Balancer
resource "azurerm_lb" "web_lb" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku = "Standard"
  frontend_ip_configuration {
    name                 = "web-lb-publicip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpublicip.id
  }
}


 
# Resource-3: Create LB Backend Pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name                = "web-backend"
  loadbalancer_id     = azurerm_lb.web_lb.id
}



# Resource-4: Create LB Probe
resource "azurerm_lb_probe" "web_lb_probe" {
  name                = "tcp-probe"
  protocol            = "Tcp"
  port                = 80
  loadbalancer_id     = azurerm_lb.web_lb.id
}



resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name                           = "web-app1-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [ azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id ]
  probe_id                       = azurerm_lb_probe.web_lb_probe.id
  loadbalancer_id                = azurerm_lb.web_lb.id
}

data "azurerm_network_interface" "webvm_nic" {
  name                = var.vm_nic
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  network_interface_id    = data.azurerm_network_interface.webvm_nic.id
  #ip_configuration_name   = azurerm_network_interface.linuxvm_nic.ip_configuration[0].name
  ip_configuration_name   = data.azurerm_network_interface.webvm_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
}

