## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.27.0/docs/resources/cognitive_account) | resource |
| [azurerm_cognitive_deployment.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.27.0/docs/resources/cognitive_deployment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.27.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.27.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cognitive_account_custom_subdomain_name"></a> [cognitive\_account\_custom\_subdomain\_name](#input\_cognitive\_account\_custom\_subdomain\_name) | Custom subdomain name for the Azure OpenAI Service, if applicable. | `string` | n/a | yes |
| <a name="input_cognitive_account_kind"></a> [cognitive\_account\_kind](#input\_cognitive\_account\_kind) | The type of Cognitive Service Account to create (e.g., OpenAI, ComputerVision). Changing this triggers resource recreation. | `string` | `"OpenAI"` | no |
| <a name="input_cognitive_account_name"></a> [cognitive\_account\_name](#input\_cognitive\_account\_name) | The name of the Azure Cognitive Service Account. Changing this triggers resource recreation. | `string` | n/a | yes |
| <a name="input_cognitive_account_public_network_access_enabled"></a> [cognitive\_account\_public\_network\_access\_enabled](#input\_cognitive\_account\_public\_network\_access\_enabled) | Controls whether public network access is enabled for the Azure OpenAI Service. | `bool` | `true` | no |
| <a name="input_cognitive_account_sku_name"></a> [cognitive\_account\_sku\_name](#input\_cognitive\_account\_sku\_name) | The pricing tier (SKU) for the Azure OpenAI Service (e.g., S0). | `string` | `"S0"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of key-value pairs to tag resources for organization and management. | `map(any)` | n/a | yes |
| <a name="input_deployment"></a> [deployment](#input\_deployment) | Configures Cognitive Services Account deployments with the following attributes:<br>  - name: The deployment name. Changing this triggers resource recreation.<br>  - model\_format: The model format (e.g., OpenAI). Changing this triggers resource recreation.<br>  - model\_name: The name of the deployment model. Changing this triggers resource recreation.<br>  - model\_version: The version of the deployment model.<br>  - scale\_type: The deployment scale type (e.g., Standard). Changing this triggers resource recreation.<br>  - rai\_policy\_name: Optional Responsible AI policy name. Changing this triggers resource recreation.<br>  - capacity: Optional Tokens-per-Minute (TPM) capacity, defaults to 1 (1000 tokens/min).<br>  - version\_upgrade\_option: Optional model version upgrade policy (e.g., OnceNewDefaultVersionAvailable, OnceCurrentVersionExpired, NoAutoUpgrade). | <pre>map(object({<br>    name                   = string<br>    model_format           = string<br>    model_name             = string<br>    model_version          = string<br>    scale_type             = string<br>    rai_policy_name        = optional(string)<br>    capacity               = optional(number)<br>    version_upgrade_option = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Defines the environment type for the backend container (e.g., dev, prod, staging). | `string` | `"dev"` | no |
| <a name="input_identity_enabled"></a> [identity\_enabled](#input\_identity\_enabled) | Enables or disables managed identity for the Cognitive Service Account. | `bool` | `false` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the managed identity type (e.g., SystemAssigned, UserAssigned). | `string` | `"SystemAssigned"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Sets the default action for network ACLs (e.g., Allow or Deny). | `string` | `"Deny"` | no |
| <a name="input_network_acls_enabled"></a> [network\_acls\_enabled](#input\_network\_acls\_enabled) | Enables or disables network Access Control Lists (ACLs) for the Cognitive Service Account. | `bool` | `false` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | A list of IP addresses or CIDR blocks allowed in network ACLs. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_rules"></a> [network\_acls\_virtual\_network\_rules](#input\_network\_acls\_virtual\_network\_rules) | A list of virtual network rules for network ACLs, specifying subnet ID and optional service endpoint settings. | <pre>list(object({<br>    subnet_id                            = string<br>    ignore_missing_vnet_service_endpoint = optional(bool)<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | The Azure region where resources will be deployed (e.g., 'weu' for West Europe). | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure region for creating the resource group. Changing this triggers resource recreation. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Azure resource group where resources will be provisioned. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cognitive_account_endpoint"></a> [cognitive\_account\_endpoint](#output\_cognitive\_account\_endpoint) | The endpoint URL of the Azure Cognitive Service Account. |
| <a name="output_cognitive_account_id"></a> [cognitive\_account\_id](#output\_cognitive\_account\_id) | The resource ID of the Azure Cognitive Service Account. |
| <a name="output_cognitive_account_location"></a> [cognitive\_account\_location](#output\_cognitive\_account\_location) | The Azure region where the Cognitive Service Account is deployed. |
| <a name="output_cognitive_account_name"></a> [cognitive\_account\_name](#output\_cognitive\_account\_name) | The name of the Azure Cognitive Service Account. |
| <a name="output_cognitive_account_primary_access_key"></a> [cognitive\_account\_primary\_access\_key](#output\_cognitive\_account\_primary\_access\_key) | The primary access key for the Azure Cognitive Service Account. |
| <a name="output_cognitive_account_resource_group_name"></a> [cognitive\_account\_resource\_group\_name](#output\_cognitive\_account\_resource\_group\_name) | The name of the resource group containing the Cognitive Service Account. |
| <a name="output_cognitive_account_secondary_access_key"></a> [cognitive\_account\_secondary\_access\_key](#output\_cognitive\_account\_secondary\_access\_key) | The secondary access key for the Azure Cognitive Service Account. |
| <a name="output_cognitive_deployment_ids"></a> [cognitive\_deployment\_ids](#output\_cognitive\_deployment\_ids) | A map of deployment names to their respective resource IDs for the Cognitive Service Account deployments. |
