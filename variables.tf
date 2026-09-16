variable "name" {
  description = "The name of the Azure OpenAI (Cognitive Account)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Cognitive Account should be created."
  type        = string
}

variable "location" {
  description = "The Azure Region where the Cognitive Account should be created."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Cognitive Account. Possible values: F0, S0."
  type        = string
  default     = "S0"
}

variable "custom_subdomain_name" {
  description = "The subdomain name used for token-based authentication."
  type        = string
  default     = null
}

variable "dynamic_throttling_enabled" {
  description = "Whether to enable the dynamic throttling for this Cognitive Account."
  type        = bool
  default     = null
}

variable "fqdns" {
  description = "List of FQDNs allowed for the Cognitive Account."
  type        = list(string)
  default     = null
}

variable "local_auth_enabled" {
  description = "Whether local authentication methods are enabled for the Cognitive Account."
  type        = bool
  default     = true
}

variable "metrics_advisor_aad_client_id" {
  description = "The Azure AD Client ID (Application ID) for the Metrics Advisor."
  type        = string
  default     = null
}

variable "metrics_advisor_aad_tenant_id" {
  description = "The Azure AD Tenant ID for the Metrics Advisor."
  type        = string
  default     = null
}

variable "metrics_advisor_super_user_name" {
  description = "The super user of the Metrics Advisor."
  type        = string
  default     = null
}

variable "metrics_advisor_website_name" {
  description = "The website name of the Metrics Advisor."
  type        = string
  default     = null
}

variable "outbound_network_access_restricted" {
  description = "Whether outbound network access is restricted for the Cognitive Account."
  type        = bool
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Cognitive Account."
  type        = bool
  default     = true
}

variable "qna_runtime_endpoint" {
  description = "A URL to link a QnAMaker cognitive account to a QnA runtime."
  type        = string
  default     = null
}

variable "custom_question_answering_search_service_id" {
  description = "If kind is TextAnalytics, this specifies the ID of the Search service."
  type        = string
  default     = null
}

variable "custom_question_answering_search_service_key" {
  description = "If kind is TextAnalytics, this specifies the key of the Search service."
  type        = string
  default     = null
  sensitive   = true
}

variable "customer_managed_key" {
  description = "A customer managed key block for the Cognitive Account."
  type = object({
    key_vault_key_id   = string
    identity_client_id = optional(string)
  })
  default = null
}

variable "identity" {
  description = "An identity block for the Cognitive Account."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "network_acls" {
  description = "Network ACL configuration for the Cognitive Account."
  type = object({
    default_action = string
    ip_rules       = optional(list(string))
    virtual_network_rules = optional(list(object({
      subnet_id                            = string
      ignore_missing_vnet_service_endpoint = optional(bool, false)
    })))
  })
  default = null
}

variable "storage" {
  description = "A list of storage blocks for the Cognitive Account."
  type = list(object({
    storage_account_id = string
    identity_client_id = optional(string)
  }))
  default = []
}

variable "deployment" {
  description = "A map of Cognitive Deployments to create for the Cognitive Account."
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
  default  = {}
  nullable = false
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Cognitive Account."
  type        = map(string)
  default     = {}
}
