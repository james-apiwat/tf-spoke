resource "azurerm_resource_group" "resourcegroup" {
  provider = azurerm.spoke
  name     = var.resourcegroup
  location = var.location
  tags     = var.tags_Sitthipon
}
