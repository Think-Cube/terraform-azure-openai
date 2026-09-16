output "id" {
  description = "The ID of the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.id
}

output "name" {
  description = "The name of the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.name
}

output "endpoint" {
  description = "The endpoint URL for the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.endpoint
}

output "primary_access_key" {
  description = "The primary access key for the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key for the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.secondary_access_key
  sensitive   = true
}

output "identity" {
  description = "The identity of the Azure OpenAI Cognitive Account."
  value       = azurerm_cognitive_account.main.identity
}
