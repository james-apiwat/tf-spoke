resource "azurerm_storage_account" "stadlosrfirst" {
  provider                        = azurerm.spoke
  name                            = "stadlosrfirst"
  resource_group_name             = azurerm_resource_group.resourcegroup.name
  location                        = var.location
  public_network_access_enabled   = true
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = var.tags_Sitthipon

}
resource "azurerm_storage_account_network_rules" "stadlosrfirst_rule" {
  provider           = azurerm.spoke
  storage_account_id = azurerm_storage_account.stadlosrfirst.id
  default_action     = "Deny"
  #  ip_rules                   = ["127.0.0.1"]
  #  virtual_network_subnet_ids = [azurerm_subnet.example.id]
  #  bypass                     = ["Metrics"]

  # private_link_access {
  #   endpoint_resource_id = "/subscriptions/373d0e1e-4813-4ec5-800b-b2957b445d58/resourceGroups/rg-adl-osr-first/providers/Microsoft.Storage/storageAccounts/stadlosrfirst"
  #   endpoint_tenant_id   = "23f8cd51-9a3f-4441-a772-73d6eaf31061"
  # }
  depends_on = [
    azurerm_storage_account.stadlosrfirst
  ]
}
