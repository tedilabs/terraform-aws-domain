# private-ca-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.10.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority_arn"></a> [certificate\_authority\_arn](#input\_certificate\_authority\_arn) | (Required) The ARN of an ACMPCA. | `string` | n/a | yes |
| <a name="input_subject_name"></a> [subject\_name](#input\_subject\_name) | (Required) A domain name for which the certificate should be issued. | `string` | n/a | yes |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the certificate. | `string` | `""` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | (Optional) The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | (Optional) Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | (Optional) List of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list (`[]`) or use the `terraform taint` command to trigger recreation. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the certificate. |
| <a name="output_certificate_authority_arn"></a> [certificate\_authority\_arn](#output\_certificate\_authority\_arn) | The ARN of an ACMPCA. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate. |
| <a name="output_status"></a> [status](#output\_status) | Status of the certificate. |
| <a name="output_subject_alternative_names"></a> [subject\_alternative\_names](#output\_subject\_alternative\_names) | List of domains that is SANs in the issued certificate. |
| <a name="output_subject_name"></a> [subject\_name](#output\_subject\_name) | The domain name for which the certificate is issued. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
