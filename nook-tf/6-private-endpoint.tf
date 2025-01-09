resource "azurerm_private_endpoint" "kv-adl-osr-nook" {
  provider            = azurerm.spoke
  name                = "kv-adl-osr-nook"
  location            = azurerm_resource_group.rg-adl-osr-nook.location
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  subnet_id           = azurerm_subnet.snet-adl-osr-nook-pe.id

  private_service_connection {
    name                           = "kv-adl-osr-nook.vault.azure.net"
    private_connection_resource_id = azurerm_key_vault.kv-adl-osr-nook.id
    is_manual_connection           = false
    # if     is_manual_connection = true
    #   request_message                   = "PL"
    subresource_names = ["vault"]
  }
    private_dns_zone_group {
      name                 = "default"
      private_dns_zone_ids = ["/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
    }
}

resource "azurerm_private_endpoint" "pe-adl-osr-nook-file" {
  provider            = azurerm.spoke
  depends_on          = [azurerm_storage_account.sttestnook, azurerm_subnet.snet-adl-osr-nook-pe]
  name                = "pe-adl-osr-nook-file"
  location            = azurerm_resource_group.rg-adl-osr-nook.location
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  subnet_id           = azurerm_subnet.snet-adl-osr-nook-pe.id

  private_service_connection {
    name                           = "pe-st-adl-osr-nook-file"
    private_connection_resource_id = azurerm_storage_account.sttestnook.id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }
    private_dns_zone_group {
      name                 = "default"
      private_dns_zone_ids = ["/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net"]
    }
}
