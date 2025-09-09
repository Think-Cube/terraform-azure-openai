variable "environment" {
  description = "Defines the environment type for the backend container (e.g., dev, prod, staging)."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "A map of key-value pairs to tag resources for organization and management."
  type        = map(any)
}

variable "region" {
  description = "The Azure region where resources will be deployed (e.g., 'weu' for West Europe)."
  type        = string
  default     = "weu"
}

variable "resource_group_location" {
  description = "The Azure region for creating the resource group. Changing this triggers resource recreation."
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group where resources will be provisioned."
  type        = string
}

variable "cognitive_account_name" {
  description = "The name of the Azure Cognitive Service Account. Changing this triggers resource recreation."
  type        = string
}

variable "cognitive_account_kind" {
  description = "The type of Cognitive Service Account to create (e.g., OpenAI, ComputerVision). Changing this triggers resource recreation."
  type        = string
  default     = "OpenAI"
}

variable "cognitive_account_custom_subdomain_name" {
  description = "Custom subdomain name for the Azure OpenAI Service, if applicable."
  type        = string
}

variable "cognitive_account_sku_name" {
  description = "The pricing tier (SKU) for the Azure OpenAI Service (e.g., S0)."
  type        = string
  default     = "S0"
}

variable "cognitive_account_public_network_access_enabled" {
  description = "Controls whether public network access is enabled for the Azure OpenAI Service."
  type        = bool
  default     = true
}

variable "deployment" {
  type = map(object({
    name                   = string
    model_format           = string
    model_name             = string
    model_version          = string
    scale_type             = string
    rai_policy_name        = optional(string)
    capacity               = optional(number)
    version_upgrade_option = optional(string)
  }))
  default     = {}
  description = <<-DESCRIPTION
    Configures Cognitive Services Account deployments with the following attributes:
      - name: The deployment name. Changing this triggers resource recreation.
      - model_format: The model format (e.g., OpenAI). Changing this triggers resource recreation.
      - model_name: The name of the deployment model. Changing this triggers resource recreation.
      - model_version: The version of the deployment model.
      - scale_type: The deployment scale type (e.g., Standard). Changing this triggers resource recreation.
      - rai_policy_name: Optional Responsible AI policy name. Changing this triggers resource recreation.
      - capacity: Optional Tokens-per-Minute (TPM) capacity, defaults to 1 (1000 tokens/min).
      - version_upgrade_option: Optional model version upgrade policy (e.g., OnceNewDefaultVersionAvailable, OnceCurrentVersionExpired, NoAutoUpgrade).
  DESCRIPTION
  nullable    = false
}

variable "identity_enabled" {
  description = "Enables or disables managed identity for the Cognitive Service Account."
  type        = bool
  default     = false
}

variable "identity_type" {
  description = "Specifies the managed identity type (e.g., SystemAssigned, UserAssigned)."
  type        = string
  default     = "SystemAssigned"
}

variable "network_acls_enabled" {
  description = "Enables or disables network Access Control Lists (ACLs) for the Cognitive Service Account."
  type        = bool
  default     = false
}

variable "network_acls_default_action" {
  description = "Sets the default action for network ACLs (e.g., Allow or Deny)."
  type        = string
  default     = "Deny"
}

variable "network_acls_ip_rules" {
  description = "A list of IP addresses or CIDR blocks allowed in network ACLs."
  type        = list(string)
  default     = []
}

variable "network_acls_virtual_network_rules" {
  description = "A list of virtual network rules for network ACLs, specifying subnet ID and optional service endpoint settings."
  type = list(object({
    subnet_id                            = string
    ignore_missing_vnet_service_endpoint = optional(bool)
  }))
  default = []
}