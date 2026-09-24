# Example: Basic — Azure Openai

Provisions an Azure OpenAI Service account with cognitive deployment support. Minimal example using required inputs only.

## Usage

```hcl
module "openai" {
  source = "../.."

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