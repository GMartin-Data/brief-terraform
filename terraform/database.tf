resource "azurerm_cosmosdb_postgresql_cluster" "main" {
  name                            = "pg${replace(var.project_name, "-", "")}${var.environment}${random_string.suffix.result}"
  location                        = data.azurerm_resource_group.main.location
  resource_group_name             = data.azurerm_resource_group.main.name
  administrator_login_password    = var.postgres_admin_password
  node_count                      = var.cosmosdb_node_count
  coordinator_server_edition      = var.cosmosdb_sku
  coordinator_vcore_count         = var.cosmosdb_vcores
  coordinator_storage_quota_in_mb = var.cosmosdb_storage
}

resource "azurerm_cosmosdb_postgresql_firewall_rule" "allow_azure" {
  name             = "AllowAzureServices"
  cluster_id       = azurerm_cosmosdb_postgresql_cluster.main.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
