resource "azurerm_network_security_group" "nsg-adl-osr-first-aks" {
  provider            = azurerm.spoke
  name                = "nsg-adl-osr-first-aks"
  location            = var.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  tags                = var.tags_Sitthipon
}

resource "azurerm_network_security_group" "nsg-adl-osr-first-lb" {
  provider            = azurerm.spoke
  name                = "nsg-adl-osr-first-lb"
  location            = var.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  tags                = var.tags_Sitthipon
}

resource "azurerm_network_security_group" "nsg-adl-osr-first-pe" {
  provider            = azurerm.spoke
  name                = "nsg-adl-osr-first-pe"
  location            = var.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  tags                = var.tags_Sitthipon
}

# Associate the NSG to subnets
resource "azurerm_subnet_network_security_group_association" "nsg-snet-adl-osr-first-aks" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adlosrfirst-001-aks.id
  network_security_group_id = azurerm_network_security_group.nsg-adl-osr-first-aks.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-snet-adl-osr-first-lb" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adlosrfirst-001-lb.id
  network_security_group_id = azurerm_network_security_group.nsg-adl-osr-first-lb.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-snet-adl-osr-first-pe" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adlosrfirst-001-pe.id
  network_security_group_id = azurerm_network_security_group.nsg-adl-osr-first-pe.id
}
