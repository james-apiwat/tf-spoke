# resource "azurerm_virtual_network_peering" "peer-vnet-adl-osr-first-to-vnet-adl-connectivity-hub-jpe-dev" {
#   provider                  = azurerm.spoke
#   name                      = "peer-vnet-adl-osr-first-to-vnet-adl-connectivity-hub-jpe-dev"
#   resource_group_name       = azurerm_resource_group.resourcegroup.name
#   virtual_network_name      = azurerm_virtual_network.vnet-adl-osr-first.name
#   allow_forwarded_traffic   = true
#   remote_virtual_network_id = "/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/virtualNetworks/vnet-adl-connectivity-hub-jpe-dev"
# }
