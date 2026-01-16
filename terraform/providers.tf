# =============================================================================
# Providers - Azure et Random
# Azure pour l'infrastructure cloud, Random pour générer des suffixes uniques
# =============================================================================

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "5e2150ec-ee17-4fa2-8714-825c2fb7d22a"
}

provider "random" {
  # Configuration options
}
