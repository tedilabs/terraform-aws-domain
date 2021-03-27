# amazon-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.34 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.34 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| subject\_name | A domain name for which the certificate should be issued. | `string` | n/a | yes |
| certificate\_transparency\_logging\_enabled | Specifies whether certificate details should be added to a certificate transparency log. | `bool` | `true` | no |
| module\_tags\_enabled | Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| name | The name of the certificate. | `string` | `""` | no |
| resource\_group\_description | The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| resource\_group\_enabled | Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| resource\_group\_name | The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| subject\_alternative\_names | List of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list (`[]`) or use the `terraform taint` command to trigger recreation. | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| validation\_dns\_managed | Specifies whether validation should be managed by the module when `validation_method` is `DNS`. | `bool` | `false` | no |
| validation\_dns\_managed\_zones | List of Hosted Zones to automatically manage the records for DNS validation as a map. The key is the name of Hosted Zone. The value is the ID of Hosted Zone. | `map(string)` | `{}` | no |
| validation\_method | Which method to use for validation. `DNS` or `EMAIL` are valid, `NONE` can be used for certificates that were imported into ACM and then into Terraform. | `string` | `"DNS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the certificate. |
| certificate\_transparency\_logging\_enabled | Whether or not the certificate transparency logging is enabled. |
| name | The name of the certificate. |
| status | Status of the certificate. |
| subject\_alternative\_names | List of domains that is SANs in the issued certificate. |
| subject\_name | The domain name for which the certificate is issued. |
| validation\_domain\_records | List of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if `DNS` validation was used. |
| validation\_emails | A list of addresses that received a validation E-Mail. Only set if `EMAIL` validation was used. |
| validation\_method | The method to use for validation. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
