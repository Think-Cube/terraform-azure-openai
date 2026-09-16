# Terraform Module — Azure OpenAI Service

Provisions an `azurerm_cognitive_account` of kind OpenAI with configurable SKU, network ACLs, identity, and customer-managed key support.

## Usage

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

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_account) | resource |
| [azurerm_cognitive_deployment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_question_answering_search_service_id"></a> [custom\_question\_answering\_search\_service\_id](#input\_custom\_question\_answering\_search\_service\_id) | If kind is TextAnalytics, this specifies the ID of the Search service. | `string` | `null` | no |
| <a name="input_custom_question_answering_search_service_key"></a> [custom\_question\_answering\_search\_service\_key](#input\_custom\_question\_answering\_search\_service\_key) | If kind is TextAnalytics, this specifies the key of the Search service. | `string` | `null` | no |
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | The subdomain name used for token-based authentication. | `string` | `null` | no |
| <a name="input_customer_managed_key"></a> [customer\_managed\_key](#input\_customer\_managed\_key) | A customer managed key block for the Cognitive Account. | <pre>object({<br>    key_vault_key_id   = string<br>    identity_client_id = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_deployment"></a> [deployment](#input\_deployment) | A map of Cognitive Deployments to create for the Cognitive Account. | <pre>map(object({<br>    name                   = string<br>    model_format           = string<br>    model_name             = string<br>    model_version          = string<br>    scale_type             = string<br>    rai_policy_name        = optional(string)<br>    capacity               = optional(number)<br>    version_upgrade_option = optional(string)<br>  }))</pre> | `{}` | no |
| <a name="input_dynamic_throttling_enabled"></a> [dynamic\_throttling\_enabled](#input\_dynamic\_throttling\_enabled) | Whether to enable the dynamic throttling for this Cognitive Account. | `bool` | `null` | no |
| <a name="input_fqdns"></a> [fqdns](#input\_fqdns) | List of FQDNs allowed for the Cognitive Account. | `list(string)` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | An identity block for the Cognitive Account. | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Whether local authentication methods are enabled for the Cognitive Account. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Cognitive Account should be created. | `string` | n/a | yes |
| <a name="input_metrics_advisor_aad_client_id"></a> [metrics\_advisor\_aad\_client\_id](#input\_metrics\_advisor\_aad\_client\_id) | The Azure AD Client ID (Application ID) for the Metrics Advisor. | `string` | `null` | no |
| <a name="input_metrics_advisor_aad_tenant_id"></a> [metrics\_advisor\_aad\_tenant\_id](#input\_metrics\_advisor\_aad\_tenant\_id) | The Azure AD Tenant ID for the Metrics Advisor. | `string` | `null` | no |
| <a name="input_metrics_advisor_super_user_name"></a> [metrics\_advisor\_super\_user\_name](#input\_metrics\_advisor\_super\_user\_name) | The super user of the Metrics Advisor. | `string` | `null` | no |
| <a name="input_metrics_advisor_website_name"></a> [metrics\_advisor\_website\_name](#input\_metrics\_advisor\_website\_name) | The website name of the Metrics Advisor. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure OpenAI (Cognitive Account). | `string` | n/a | yes |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | Network ACL configuration for the Cognitive Account. | <pre>object({<br>    default_action = string<br>    ip_rules       = optional(list(string))<br>    virtual_network_rules = optional(list(object({<br>      subnet_id                            = string<br>      ignore_missing_vnet_service_endpoint = optional(bool, false)<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_outbound_network_access_restricted"></a> [outbound\_network\_access\_restricted](#input\_outbound\_network\_access\_restricted) | Whether outbound network access is restricted for the Cognitive Account. | `bool` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this Cognitive Account. | `bool` | `true` | no |
| <a name="input_qna_runtime_endpoint"></a> [qna\_runtime\_endpoint](#input\_qna\_runtime\_endpoint) | A URL to link a QnAMaker cognitive account to a QnA runtime. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Cognitive Account should be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the Cognitive Account. Possible values: F0, S0. | `string` | `"S0"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | A list of storage blocks for the Cognitive Account. | <pre>list(object({<br>    storage_account_id = string<br>    identity_client_id = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Cognitive Account. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint URL for the Azure OpenAI Cognitive Account. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Azure OpenAI Cognitive Account. |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity of the Azure OpenAI Cognitive Account. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Azure OpenAI Cognitive Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the Azure OpenAI Cognitive Account. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key for the Azure OpenAI Cognitive Account. |
<!-- END_TF_DOCS -->