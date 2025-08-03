module "resource_group" {
  source = "../MODULES_child/azurerm_resource_group"
  resource_group_name = "Ganshiv-rg"
  resource_group_location = "East US"
} 

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source = "../MODULES_child/azurerm_virtual_network"
  virtual_network_name = "Ganshiv-vnet"
  virtual_network_location = "East US"
  resource_group_name = "Ganshiv-rg"
  address_space = ["10.0.0.0/16"]
  } 

  module "Ganshiv_Frontend_subnet" {
    depends_on = [ module.virtual_network ]
    source = "../MODULES_child/azurerm_virtual_subnet"
    subnet_name = "Ganshiv_Frontend-subnet"
    resource_group_name = "Ganshiv-rg"
    virtual_network_name = "Ganshiv-vnet"
    address_prefixes = ["10.0.1.0/24"]  
  }

   module "Ganshiv_Backend_subnet" {
    depends_on = [ module.virtual_network ]
    source = "../MODULES_child/azurerm_virtual_subnet"
    subnet_name = "Ganshiv_Backend-subnet"
    resource_group_name = "Ganshiv-rg"
    virtual_network_name = "Ganshiv-vnet"
    address_prefixes = ["10.0.2.0/24"] 
  }
module "Ganshiv_Public_IP" {
  source = "../MODULES_child/azurerm_public_ip"
  public_ip_name = "Ganshiv-PublicIP"
  resource_group_name = "Ganshiv-rg"
  resource_group_location = "East US"
  allocation_method = "Static"
}
module "Ganshiv_frontend_vm" {
  depends_on = [ module.Ganshiv_Frontend_subnet ]
  source = "../MODULES_child/azurerm_virtual_machine"
  nic_name = "Ganshiv-Frontend-nic"
  location = "East US"
  resource_group_name = "Ganshiv-rg"
  subnet_id = "/subscriptions/ae3dc4b8-c6c2-443e-b765-214338d62948/resourceGroups/rg-Manish/providers/Microsoft.Network/virtualNetworks/Manishvnet/subnets/Frontend-subnet"
  vm_name = "Ganshiv-Frontend-vm"
  vm_size = "Standard_B1s"
  admin_username = "adminuser"
  admin_password = "Ganshiv@2005"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-jammy"
  image_sku = "22_04-lts-gen2"
  image_version = "latest"
  
}

module "Ganshiv_Backend_vm" {
  depends_on = [ module.Ganshiv_Backend_subnet ]
  source = "../MODULES_child/azurerm_virtual_machine"
  nic_name = "Ganshiv-Backend-nic"
  location = "East US"
  resource_group_name = "Ganshiv-rg"
  subnet_id = "/subscriptions/ae3dc4b8-c6c2-443e-b765-214338d62948/resourceGroups/rg-Manish/providers/Microsoft.Network/virtualNetworks/Manishvnet/subnets/Backend-subnet"
  vm_name = "Ganshiv-Backend-vm"
  vm_size = "Standard_B1s"
  admin_username = "adminuser"
  admin_password = "Ganshiv@2005"
  image_publisher = "Canonical"
  image_offer = "0001-com-ubuntu-server-focal"
  image_sku = "20_04-lts-gen2"
  image_version = "latest"  
}
module "Ganshivsqiserver" {
  depends_on = [ module.Ganshiv_Backend_vm ]
  source = "../MODULES_child/azurerm_sql_server"
  sql_server_name = "Ganshivsqlserver"
  resource_group_name = "Ganshiv-rg"
  location = "East US"
  administrator_login = "sqladmin"
  administrator_login_password = "Ganshiv@2005" 
}
module "Ganshivsqldatabase" {
  depends_on = [ module.Ganshivsqiserver ]
  source = "../MODULES_child/azurerm_sql_database"
  sql_database_name = "Ganshivsqldatabase"
  sql_server_id = ""
  
}