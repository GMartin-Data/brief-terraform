# =============================================================================
# Storage Account + Containers (raw, processed)
# Nommage : st<projet><env><suffix> - le suffix random garantit l'unicité globale
# Les tirets sont retirés car interdits dans les noms de Storage Account
# =============================================================================

resource "azurerm_storage_account" "main" {
  name                     = "st${replace(var.project_name, "-", "")}${var.environment}${random_string.suffix.result}"
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = var.storage_account_type
  account_kind             = "StorageV2"
  account_replication_type = var.storage_account_replication
}

resource "azurerm_storage_container" "raw" {
  name                  = "raw"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}

resource "azurerm_storage_container" "processed" {
  name                  = "processed"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}
