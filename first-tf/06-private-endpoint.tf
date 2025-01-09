resource "azurerm_private_endpoint" "pe-st-adl-osr-first-file" {
  provider            = azurerm.spoke
  name                = "pe-st-adl-osr-first-file"
  location            = var.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  subnet_id           = azurerm_subnet.snet-adlosrfirst-001-pe.id

  private_service_connection {
    name                           = "pe-st-adl-osr-first-jpe-dev-file"
    private_connection_resource_id = azurerm_storage_account.stadlosrfirst.id
    is_manual_connection           = false
    # if     is_manual_connection = true
    #   request_message                   = "PL"
    subresource_names = ["file"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = ["/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net"]
  }

  tags = var.tags_Sitthipon
}


resource "azurerm_private_endpoint" "kv-adl-osr-first" {
  provider            = azurerm.spoke
  name                = "kv-adl-osr-first"
  location            = azurerm_resource_group.resourcegroup.location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  subnet_id           = azurerm_subnet.snet-adlosrfirst-001-pe.id

  private_service_connection {
    name                           = "privatelink.vaultcore.azure.net"
    private_connection_resource_id = azurerm_key_vault.kv-adl-osr-first.id
    is_manual_connection           = false
    # if     is_manual_connection = true
    #   request_message                   = "PL"
    subresource_names = ["vault"]
  }
  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = ["/subscriptions/756952db-9653-4f48-bed7-49ea8d2a8ada/resourceGroups/rg-adl-connectivity-hub-jpe-dev/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net"]
  }
  tags = var.tags_Sitthipon
}
