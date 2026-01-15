resource "azurerm_container_app_environment" "main" {
  name                = "cae-${var.project_name}-${var.environment}-${random_string.suffix.result}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
}

resource "azurerm_container_app" "main" {
  name                         = "ca-${var.project_name}-pipeline-${var.environment}"
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = data.azurerm_resource_group.main.name
  revision_mode                = "Single"

  secret {
    name  = "acr-password"
    value = azurerm_container_registry.main.admin_password
  }
  secret {
    name  = "storage-connection-string"
    value = azurerm_storage_account.main.primary_connection_string
  }
  secret {
    name  = "postgres-password"
    value = var.postgres_admin_password
  }

  registry {
    server               = azurerm_container_registry.main.login_server
    username             = azurerm_container_registry.main.admin_username
    password_secret_name = "acr-password"
  }

  template {
    min_replicas = var.container_app_min_replicas
    max_replicas = var.container_app_max_replicas
    container {
      name   = "${var.project_name}-pipeline"
      image  = "${azurerm_container_registry.main.login_server}/nyc-taxi-pipeline:latest"
      cpu    = var.container_app_cpu
      memory = var.container_app_memory

      env {
        name        = "AZURE_STORAGE_CONNECTION_STRING"
        secret_name = "storage-connection-string"
      }
      env {
        name  = "AZURE_CONTAINER_NAME"
        value = "raw"
      }
      env {
        name  = "POSTGRES_HOST"
        value = azurerm_cosmosdb_postgresql_cluster.main.servers[0].fqdn # Full Qualified Domain Name
      }
      env {
        name  = "POSTGRES_PORT"
        value = "5432"
      }
      env {
        name  = "POSTGRES_DB"
        value = "citus"
      }
      env {
        name  = "POSTGRES_USER"
        value = var.postgres_admin_username
      }
      env {
        name        = "POSTGRES_PASSWORD"
        secret_name = "postgres-password"
      }
      env {
        name  = "POSTGRES_SSL_MODE"
        value = "require"
      }
      env {
        name  = "START_DATE"
        value = var.pipeline_start_date
      }
      env {
        name  = "END_DATE"
        value = var.pipeline_end_date
      }
    }
  }
}
