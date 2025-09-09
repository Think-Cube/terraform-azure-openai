resource "azurerm_cognitive_deployment" "main" {
  for_each = var.deployment

  cognitive_account_id   = azurerm_cognitive_account.main.id
  name                   = each.value.name
  rai_policy_name        = each.value.rai_policy_name
  version_upgrade_option = each.value.version_upgrade_option

  sku {
    name     = each.value.scale_type
    capacity = try(each.value.capacity, 1)
  }

  model {
    format  = each.value.model_format
    name    = each.value.model_name
    version = each.value.model_version
  }
}
