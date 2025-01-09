resource "azurerm_user_assigned_identity" "id-adl-osr-nook" {
  provider            = azurerm.spoke
  name                = "id-adl-osr-nook"
  resource_group_name = azurerm_resource_group.rg-adl-osr-nook.name
  location            = azurerm_resource_group.rg-adl-osr-nook.location
}

# resource "azurerm_role_assignment" "aksroleassign" {
#   provider = azurerm.spoke
#   role_definition_name = "Contributor"
#   scope                = azurerm_route_table.route-table.id
#   principal_id         = azurerm_user_assigned_identity.id-adl-osr-nook.principal_id
# }