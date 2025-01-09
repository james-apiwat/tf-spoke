# resource "azurerm_virtual_network_peering" "peer-spoke-to-hub" {
#   provider = azurerm.spoke
#   depends_on                = [azurerm_virtual_network.vnet-adl-osr-nook]
#   name                      = "peer-spoke-to-hub"
#   resource_group_name       = azurerm_resource_group.rg-adl-osr-nook.name
#   virtual_network_name      = azurerm_virtual_network.vnet-adl-osr-nook.name
#   remote_virtual_network_id = "/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/virtualNetworks/vnet-adl-connectivity-hub-jpe-dev"
# }
