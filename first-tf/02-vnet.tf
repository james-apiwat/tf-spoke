# 1. Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet-adl-osr-first" {
  provider            = azurerm.spoke
  name                = var.vnet
  resource_group_name = azurerm_resource_group.resourcegroup.name
  location            = azurerm_resource_group.resourcegroup.location
  address_space       = ["172.28.22.0/26"]
  tags                = var.tags_Sitthipon
}

# 2. create subnet
resource "azurerm_subnet" "snet-adlosrfirst-001-aks" {
  provider             = azurerm.spoke
  name                 = "snet-adlosrfirst-001-aks"
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-first.name
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  address_prefixes     = ["172.28.22.0/27"]
}

resource "azurerm_subnet" "snet-adlosrfirst-001-lb" {
  provider             = azurerm.spoke
  name                 = "snet-adlosrfirst-001-lb"
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-first.name
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  address_prefixes     = ["172.28.22.48/28"]
}

resource "azurerm_subnet" "snet-adlosrfirst-001-pe" {
  provider             = azurerm.spoke
  name                 = "snet-adlosrfirst-001-pe"
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-first.name
  resource_group_name  = azurerm_resource_group.resourcegroup.name
  address_prefixes     = ["172.28.22.32/28"]
}
