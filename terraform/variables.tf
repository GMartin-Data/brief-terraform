# Général
variable "resource_group_name" {
  description = "Nom du Resource Group existant"
  type        = string
  default     = "gmartinRG"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
}

variable "environment" {
  description = "Environnement de déploiement"
  type        = string
}

variable "location" {
  description = "Emplacement des ressources Azure"
  type        = string
}

# Storage account
variable "storage_account_type" {
  description = "Type de compte de stockage"
  type        = string
}

variable "storage_account_replication" {
  description = "Type de réplication du compte de stockage"
  type        = string
}

# Container Registry
variable "acr_sku" {
  description = "SKU du Azure Container Registry"
  type        = string
}


# Cosmos DB PostgreSQL
variable "cosmosdb_sku" {
  description = "SKU de la base de données Cosmos DB PostgreSQL"
  type        = string
}

variable "cosmosdb_vcores" {
  description = "Nombre de vCores pour la base de données Cosmos DB PostgreSQL"
  type        = number
}

variable "cosmosdb_storage" {
  description = "Taille du stockage pour la base de données Cosmos DB PostgreSQL (en Mo)"
  type        = number
}

variable "cosmosdb_node_count" {
  description = "Nombre de nœuds pour la base de données Cosmos DB PostgreSQL"
  type        = number
}


variable "postgres_admin_username" {
  description = "Nom d'utilisateur administrateur pour PostgreSQL"
  type        = string
}

variable "postgres_admin_password" {
  description = "Mot de passe administrateur pour PostgreSQL"
  type        = string
  sensitive   = true # Empêche terraform d'afficher la valeur dans les logs
}

# Log Analytics
variable "log_analytics_sku" {
  description = "SKU du Log Analytics Workspace"
  type        = string
}

variable "log_analytics_retention_days" {
  description = "Durée de rétention des données dans le Log Analytics Workspace (en jours)"
  type        = number
}

# Container App
variable "container_app_cpu" {
  description = "Quantité de CPU pour la Container App"
  type        = string
}

variable "container_app_memory" {
  description = "Quantité de mémoire pour la Container App"
  type        = string
}

variable "container_app_min_replicas" {
  description = "Nombre minimum de réplicas pour la Container App"
  type        = number
}

variable "container_app_max_replicas" {
  description = "Nombre maximum de réplicas pour la Container App"
  type        = number
}

# Pipeline
variable "pipeline_start_date" {
  description = "Date de début du pipeline (format YYYY-MM)"
  type        = string
}

variable "pipeline_end_date" {
  description = "Date de fin du pipeline (format YYYY-MM)"
  type        = string
}
