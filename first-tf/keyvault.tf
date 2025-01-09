data "azurerm_client_config" "current" {
  provider = azurerm.spoke
}

resource "azurerm_key_vault" "kv-adl-osr-first" {
  provider                      = azurerm.spoke
  name                          = "kv-adl-osr-first"
  location                      = azurerm_resource_group.resourcegroup.location
  resource_group_name           = azurerm_resource_group.resourcegroup.name
  enabled_for_disk_encryption   = false
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 90
  purge_protection_enabled      = true
  public_network_access_enabled = false
  sku_name                      = "standard"
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
    #           ip_rules                   = [
    #              + "68.24.22.2",
    #              - "68.24.22.2/32",
    #              + "68.65.48.2",
    #              - "68.65.48.2/32",
    #            ]
    virtual_network_subnet_ids = []
  }

  tags = var.tags_Sitthipon

}


resource "azurerm_key_vault_access_policy" "batch_keyvault" {
  provider     = azurerm.spoke
  key_vault_id = azurerm_key_vault.kv-adl-osr-first.id
  tenant_id    = "23f8cd51-9a3f-4441-a772-73d6eaf31061"
  object_id    = azurerm_user_assigned_identity.id-adl-osr-first.principal_id

  secret_permissions = [
    "Get",
    "List",
  ]

}
