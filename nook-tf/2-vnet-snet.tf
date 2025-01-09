resource "azurerm_virtual_network" "vnet-adl-osr-nook" {
  provider            = azurerm.spoke
  name                = "vnet-adl-osr-nook"
  address_space       = ["172.28.20.0/26"]
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
}

resource "azurerm_subnet" "snet-adl-osr-nook-aks" {
  provider             = azurerm.spoke
  name                 = "snet-adl-osr-nook-aks"
  address_prefixes     = ["172.28.20.0/27"]
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-nook.name
  resource_group_name  = azurerm_resource_group.rg-adl-osr-nook.name
}

resource "azurerm_subnet" "snet-adl-osr-nook-pe" {
  provider             = azurerm.spoke
  name                 = "snet-adl-osr-nook-pe"
  address_prefixes     = ["172.28.20.32/28"]
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-nook.name
  resource_group_name  = azurerm_resource_group.rg-adl-osr-nook.name
}

resource "azurerm_subnet" "snet-adl-osr-nook-lb" {
  provider             = azurerm.spoke
  name                 = "snet-adl-osr-nook-lb"
  address_prefixes     = ["172.28.20.48/28"]
  virtual_network_name = azurerm_virtual_network.vnet-adl-osr-nook.name
  resource_group_name  = azurerm_resource_group.rg-adl-osr-nook.name
}