resource "azurerm_route_table" "route-table" {
  provider            = azurerm.spoke
  depends_on          = [azurerm_resource_group.rg-adl-osr-nook]
  name                = "route-table"
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
  #   disable_bgp_route_propagation = false

  route {
    name                   = "AzfwDefaultRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.80.1.68"
  }
}

resource "azurerm_subnet_route_table_association" "route-table-ass-aks-snet" {
  provider       = azurerm.spoke
  depends_on     = [azurerm_route_table.route-table]
  subnet_id      = azurerm_subnet.snet-adl-osr-nook-aks.id
  route_table_id = azurerm_route_table.route-table.id
}