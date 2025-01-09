resource "azurerm_network_security_group" "snet-adl-osr-nook-aks" {
  provider            = azurerm.spoke
  name                = "snet-adl-osr-nook-aks"
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
}

resource "azurerm_network_security_group" "snet-adl-osr-nook-pe" {
  provider            = azurerm.spoke
  name                = "snet-adl-osr-nook-pe"
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
}

resource "azurerm_network_security_group" "snet-adl-osr-nook-lb" {
  provider            = azurerm.spoke
  name                = "snet-adl-osr-nook-lb"
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
}

resource "azurerm_network_security_rule" "rule-allow-snet-aks" {
  provider                    = azurerm.spoke
  name                        = "rule-allow-snet-aks"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["5432"]
  source_address_prefixes     = ["172.28.20.0/28"]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-adl-osr-nook.name
  network_security_group_name = azurerm_network_security_group.snet-adl-osr-nook-aks.name
}

resource "azurerm_network_security_rule" "rule-allow-snet-pe" {
  provider                    = azurerm.spoke
  name                        = "rule-allow-snet-pe"
  priority                    = 4094
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "172.28.20.16/28"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-adl-osr-nook.name
  network_security_group_name = azurerm_network_security_group.snet-adl-osr-nook-pe.name
}

resource "azurerm_network_security_rule" "rule-allow-snet-lb" {
  provider                    = azurerm.spoke
  name                        = "rule-allow-snet-lb"
  priority                    = 4095
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "AzureLoadBalancer"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-adl-osr-nook.name
  network_security_group_name = azurerm_network_security_group.snet-adl-osr-nook-lb.name
}

resource "azurerm_subnet_network_security_group_association" "nsg-ass-snet-adl-osr-nook-aks" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adl-osr-nook-aks.id
  network_security_group_id = azurerm_network_security_group.snet-adl-osr-nook-aks.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-ass-snet-adl-osr-nook-pe" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adl-osr-nook-pe.id
  network_security_group_id = azurerm_network_security_group.snet-adl-osr-nook-pe.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-ass-snet-adl-osr-nook-lb" {
  provider                  = azurerm.spoke
  subnet_id                 = azurerm_subnet.snet-adl-osr-nook-lb.id
  network_security_group_id = azurerm_network_security_group.snet-adl-osr-nook-lb.id
}