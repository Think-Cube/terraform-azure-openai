resource "azurerm_cognitive_account" "main" {
  name                          = "${var.environment}-${var.cognitive_account_name}-${var.region}-oai"
  location                      = data.azurerm_resource_group.rg.location
  resource_group_name           = data.azurerm_resource_group.rg.name
  kind                          = var.cognitive_account_kind
  custom_subdomain_name         = var.cognitive_account_custom_subdomain_name
  sku_name                      = var.cognitive_account_sku_name
  public_network_access_enabled = var.cognitive_account_public_network_access_enabled
  tags                          = var.default_tags

  dynamic "identity" {
    for_each = var.identity_enabled ? [1] : []
    content {
      type = var.identity_type
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls_enabled ? [1] : []
    content {
      default_action = var.network_acls_default_action
      ip_rules       = var.network_acls_ip_rules

      dynamic "virtual_network_rules" {
        for_each = var.network_acls_virtual_network_rules
        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = lookup(virtual_network_rules.value, "ignore_missing_vnet_service_endpoint", false)
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
