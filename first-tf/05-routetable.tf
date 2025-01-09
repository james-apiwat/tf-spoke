resource "azurerm_route_table" "azfwroutetable-adl-osr-first-aks" {
  provider            = azurerm.spoke
  name                = "route-adl-osr-first-aks"
  resource_group_name = azurerm_resource_group.resourcegroup.name
  location            = azurerm_resource_group.resourcegroup.location
  ##  disable_bgp_route_propagation = false

  route {
    name                   = "AzfwDefaultRoute"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.80.1.68"
  }

  tags = var.tags_Sitthipon
}


# snet-common-stg-mobile-be-mdm-aks TO route-common-stg-mobile-be-mdm
resource "azurerm_subnet_route_table_association" "route-common-stg-mobile-be-mdm-aks" {
  depends_on     = [azurerm_route_table.azfwroutetable-adl-osr-first-aks]
  provider       = azurerm.spoke
  subnet_id      = azurerm_subnet.snet-adlosrfirst-001-aks.id
  route_table_id = azurerm_route_table.azfwroutetable-adl-osr-first-aks.id
}
