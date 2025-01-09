terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.78.0"
    }
  }
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
  features {}
  subscription_id = "373d0e1e-4813-4ec5-800b-b2957b445d58"
  tenant_id       = "23f8cd51-9a3f-4441-a772-73d6eaf31061"
  alias           = "spoke"
  skip_provider_registration = true
}
