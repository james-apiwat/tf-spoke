resource "azurerm_resource_group" "rg-adl-osr-nook" {
  provider = azurerm.spoke
  name     = "rg-adl-osr-nook"
  location = "Japan East"
}