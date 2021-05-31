# amazon-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.42 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.42 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_resourcegroups_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/resourcegroups_group) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subject_name"></a> [subject\_name](#input\_subject\_name) | A domain name for which the certificate should be issued. | `string` | n/a | yes |
| <a name="input_certificate_transparency_logging_enabled"></a> [certificate\_transparency\_logging\_enabled](#input\_certificate\_transparency\_logging\_enabled) | Specifies whether certificate details should be added to a certificate transparency log. | `bool` | `true` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the certificate. | `string` | `""` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | List of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list (`[]`) or use the `terraform taint` command to trigger recreation. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_validation_dns_managed"></a> [validation\_dns\_managed](#input\_validation\_dns\_managed) | Specifies whether validation should be managed by the module when `validation_method` is `DNS`. | `bool` | `false` | no |
| <a name="input_validation_dns_managed_zones"></a> [validation\_dns\_managed\_zones](#input\_validation\_dns\_managed\_zones) | List of Hosted Zones to automatically manage the records for DNS validation as a map. The key is the name of Hosted Zone. The value is the ID of Hosted Zone. | `map(string)` | `{}` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | Which method to use for validation. `DNS` or `EMAIL` are valid, `NONE` can be used for certificates that were imported into ACM and then into Terraform. | `string` | `"DNS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the certificate. |
| <a name="output_certificate_transparency_logging_enabled"></a> [certificate\_transparency\_logging\_enabled](#output\_certificate\_transparency\_logging\_enabled) | Whether or not the certificate transparency logging is enabled. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate. |
| <a name="output_status"></a> [status](#output\_status) | Status of the certificate. |
| <a name="output_subject_alternative_names"></a> [subject\_alternative\_names](#output\_subject\_alternative\_names) | List of domains that is SANs in the issued certificate. |
| <a name="output_subject_name"></a> [subject\_name](#output\_subject\_name) | The domain name for which the certificate is issued. |
| <a name="output_validation_domain_records"></a> [validation\_domain\_records](#output\_validation\_domain\_records) | List of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if `DNS` validation was used. |
| <a name="output_validation_emails"></a> [validation\_emails](#output\_validation\_emails) | A list of addresses that received a validation E-Mail. Only set if `EMAIL` validation was used. |
| <a name="output_validation_method"></a> [validation\_method](#output\_validation\_method) | The method to use for validation. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
