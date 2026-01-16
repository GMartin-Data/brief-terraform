output "acr-name" {
  description = "Nom de l'Azure Container Registry"
  value       = azurerm_container_registry.main.name
}

output "acr-login-server" {
  description = "URL de l'Azure Container Registry"
  value       = azurerm_container_registry.main.login_server
}

output "storage-connection-string" {
  description = "Chaîne de connexion du compte de stockage"
  value       = azurerm_storage_account.main.primary_connection_string
  sensitive   = true
}

output "cosmosdb-connection-string" {
  description = "Chaîne de connexion de la base de données Cosmos DB PostgreSQL"
  value       = "postgresql://citus:${var.postgres_admin_password}@${azurerm_cosmosdb_postgresql_cluster.main.servers[0].fqdn}:5432/citus?sslmode=require"
  sensitive   = true
}

output "container-app-name" {
  description = "Nom de l'Azure Container App"
  value       = azurerm_container_app.main.name
}

output "resource-group-name" {
  description = "Nom du Resource Group"
  value       = data.azurerm_resource_group.main.name
}

