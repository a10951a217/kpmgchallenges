resource_group_name = "myapp-rg"
location = "eastus"

vnet_name = "myapp-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnet_name = ["myapp-websubnet", "myapp-appsubnet", "myapp-dbsubnet"]
subnet_address = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

inbound_ports_map = [
  {
    "100" : "80",
    "110" : "443",
    "120" : "22"
  },
  {
    "100" : "80",
    "110" : "443",
    "120" : "8080",
    "130" : "22"
  },
  {
    "100" : "3306",
    "110" : "1433",
    "120" : "5432"
  }
]

nic_name = ["web-linuxvm-nic", "app-linuxvm-nic", "db-linuxvm-nic"]

vm_ipconfig_name = ["webvm-ipconfig", "appvm-ipconfig", "dbvm-ipconfig"]


vm_name = ["web-linuxvm", "app-linuxvm", "db-linuxvm"]

admin_username = ["webvmadmin", "appvmadmin", "dbvmadmin"]

# admin_password = ["Eeb1vmpAssword$", "Eeb1vmpAssword$", "Eeb1vmpAssword$"]

lbpublicip_name = "lb-public-ip"
lb_name = "myapp-lb"


backend_pool_name = "myapp-backend-pool"

