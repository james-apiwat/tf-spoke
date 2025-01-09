resource "azurerm_user_assigned_identity" "id-adl-osr-first" {
  provider            = azurerm.spoke
  name                = "id-adl-osr-first"
  resource_group_name = azurerm_resource_group.resourcegroup.name
  location            = azurerm_resource_group.resourcegroup.location
  tags                = var.tags_Sitthipon
}


# resource "azurerm_role_assignment" "netcontributor" {
#   provider             = azurerm.spoke
#   role_definition_name = "Network Contributor"
#   scope                = "/subscriptions/373d0e1e-4813-4ec5-800b-b2957b445d58/resourceGroups/rg-adl-osr-first/providers/Microsoft.Network/routeTables/route-adl-osr-first-aks"
#   principal_id         = azurerm_user_assigned_identity.id-adl-osr-first.principal_id
# }


