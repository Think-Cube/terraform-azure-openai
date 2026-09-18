# Example: Advanced — Azure OpenAI Service

Provisions an Azure OpenAI account with network ACLs, system-assigned identity, disabled local auth and GPT-4o + text-embedding deployments.

```hcl
module "openai" {
  source = "github.com/Think-Cube/terraform-azure-openai?ref=v1.0.0"

  name                  = "oai-example-prod"
  resource_group_name   = "rg-example"
  location              = "Sweden Central"
  sku_name              = "S0"
  custom_subdomain_name = "oai-example-prod"

  public_network_access_enabled      = false
  local_auth_enabled                 = false
  outbound_network_access_restricted = true
  dynamic_throttling_enabled         = true

  identity = {
    type = "SystemAssigned"
  }

  network_acls = {
    default_action = "Deny"
    ip_rules       = ["203.0.113.0/24"]
    virtual_network_rules = [
      {
        subnet_id                            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/virtualNetworks/vnet-example/subnets/snet-app"
        ignore_missing_vnet_service_endpoint = false
      }
    ]
  }

  deployment = {
    "gpt-4o" = {
      name                   = "gpt-4o"
      model_format           = "OpenAI"
      model_name             = "gpt-4o"
      model_version          = "2024-08-06"
      scale_type             = "Standard"
      capacity               = 10
      version_upgrade_option = "OnceNewDefaultVersionAvailable"
    }
    "text-embedding-3-large" = {
      name          = "text-embedding-3-large"
      model_format  = "OpenAI"
      model_name    = "text-embedding-3-large"
      model_version = "1"
      scale_type    = "Standard"
      capacity      = 120
    }
  }

  tags = {
    environment = "prod"
    managed_by  = "terraform"
    cost_center = "ai"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_openai"></a> [openai](#module\_openai) | github.com/Think-Cube/terraform-azure-openai | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
