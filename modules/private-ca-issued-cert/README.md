# private-ca-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.12.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority"></a> [certificate\_authority](#input\_certificate\_authority) | (Required) The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority) that will be used to issue the certificate. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Required) A domain name for which the certificate should be issued. FQDN (Fully qualified domain name), such as `www.example.com`, that you want to secure with an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the same domain. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the certificate. | `string` | n/a | yes |
| <a name="input_early_renewal_duration"></a> [early\_renewal\_duration](#input\_early\_renewal\_duration) | (Optional) Amount of time to start automatic renewal process before expiration. Has no effect if less than 60 days. Represented by either a subset of RFC 3339 duration supporting years, months, and days (e.g., `P90D`), or a string such as `2160h`. | `string` | `null` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) The region in which to create the module resources. If not provided, the module resources will be created in the provider's configured region. | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Optional) A configurations of Resource Group for this module. `resource_group` as defined below.<br/>    (Optional) `enabled` - Whether to create Resource Group to find and group AWS resources which are created by this module. Defaults to `true`.<br/>    (Optional) `name` - The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. If not provided, a name will be generated using the module name and instance name.<br/>    (Optional) `description` - The description of Resource Group. Defaults to `Managed by Terraform.`. | <pre>object({<br/>    enabled     = optional(bool, true)<br/>    name        = optional(string, "")<br/>    description = optional(string, "Managed by Terraform.")<br/>  })</pre> | `{}` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | (Optional) A list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the certificate. |
| <a name="output_certificate_authority"></a> [certificate\_authority](#output\_certificate\_authority) | The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority). |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name for which the certificate is issued. |
| <a name="output_early_renewal_duration"></a> [early\_renewal\_duration](#output\_early\_renewal\_duration) | The time before certificate expiration when ACM starts attempting to renew the certificate. |
| <a name="output_effective_date"></a> [effective\_date](#output\_effective\_date) | Effective date and time of the certificate. Start of the validity period of the certificate. |
| <a name="output_expiration_date"></a> [expiration\_date](#output\_expiration\_date) | Expiration date and time of the certificate. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the certificate. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate. |
| <a name="output_region"></a> [region](#output\_region) | The AWS region this module resources resides in. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The resource group created to manage resources in this module. |
| <a name="output_status"></a> [status](#output\_status) | Status of the certificate. |
| <a name="output_subject_alternative_names"></a> [subject\_alternative\_names](#output\_subject\_alternative\_names) | The list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. |
| <a name="output_type"></a> [type](#output\_type) | The type of the certificate. |
<!-- END_TF_DOCS -->
