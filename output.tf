output "cognitive_account_id" {
  value       = azurerm_cognitive_account.main.id
  description = "The resource ID of the Azure Cognitive Service Account."
  sensitive   = false
}

output "cognitive_account_location" {
  value       = azurerm_cognitive_account.main.location
  description = "The Azure region where the Cognitive Service Account is deployed."
  sensitive   = false
}

output "cognitive_account_name" {
  value       = azurerm_cognitive_account.main.name
  description = "The name of the Azure Cognitive Service Account."
  sensitive   = false
}

output "cognitive_account_resource_group_name" {
  value       = azurerm_cognitive_account.main.resource_group_name
  description = "The name of the resource group containing the Cognitive Service Account."
  sensitive   = false
}

output "cognitive_account_endpoint" {
  value       = azurerm_cognitive_account.main.endpoint
  description = "The endpoint URL of the Azure Cognitive Service Account."
  sensitive   = false
}

output "cognitive_account_primary_access_key" {
  value       = azurerm_cognitive_account.main.primary_access_key
  description = "The primary access key for the Azure Cognitive Service Account."
  sensitive   = true
}

output "cognitive_account_secondary_access_key" {
  value       = azurerm_cognitive_account.main.secondary_access_key
  description = "The secondary access key for the Azure Cognitive Service Account."
  sensitive   = true
}

output "cognitive_deployment_ids" {
  value       = { for k, v in azurerm_cognitive_deployment.main : k => v.id }
  description = "A map of deployment names to their respective resource IDs for the Cognitive Service Account deployments."
  sensitive   = false
}