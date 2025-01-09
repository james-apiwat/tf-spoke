resource "azurerm_storage_account" "sttestnook" {
  provider                        = azurerm.spoke
  depends_on                      = [azurerm_resource_group.rg-adl-osr-nook]
  name                            = "sttestnook"
  resource_group_name             = azurerm_resource_group.rg-adl-osr-nook.name
  location                        = azurerm_resource_group.rg-adl-osr-nook.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  public_network_access_enabled   = false
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account_network_rules" "storage_rule" {
  provider                   = azurerm.spoke
  depends_on                 = [azurerm_storage_account.sttestnook]
  storage_account_id         = azurerm_storage_account.sttestnook.id
  default_action             = "Deny"
  ip_rules                   = []
  bypass                     = ["None"]
  virtual_network_subnet_ids = []
}
