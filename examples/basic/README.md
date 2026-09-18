# Example: Terraform Module — Azure OpenAI Service

Provisions an `azurerm_cognitive_account` of kind OpenAI with configurable SKU, network ACLs, identity, and customer-managed key support.

```hcl
module "openai" {
  source = "github.com/Think-Cube/terraform-azure-openai?ref=v1.0.0"

  name                  = "my-openai"
  resource_group_name   = "my-rg"
  location              = "Sweden Central"
  sku_name              = "S0"
  custom_subdomain_name = "my-openai-instance"

  public_network_access_enabled = true
  local_auth_enabled            = true

  tags = {
    environment = "dev"
    managed_by  = "terraform"
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