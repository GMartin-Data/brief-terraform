# =============================================================================
# Azure Container Registry
# admin_enabled = true requis pour que Container Apps puisse pull les images
# =============================================================================

resource "azurerm_container_registry" "main" {
  name                = "acr${replace(var.project_name, "-", "")}${var.environment}${random_string.suffix.result}"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  sku                 = var.acr_sku
  admin_enabled       = true
}
