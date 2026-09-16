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