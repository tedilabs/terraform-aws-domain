# private-ca-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.30 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.30 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| certificate\_authority\_arn | The ARN of an ACMPCA. | `string` | n/a | yes |
| subject\_name | A domain name for which the certificate should be issued. | `string` | n/a | yes |
| name | The name of the certificate. | `string` | `""` | no |
| subject\_alternative\_names | List of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list (`[]`) or use the `terraform taint` command to trigger recreation. | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the certificate. |
| certificate\_authority\_arn | The ARN of an ACMPCA. |
| name | The name of the certificate. |
| status | Status of the certificate. |
| subject\_alternative\_names | List of domains that is SANs in the issued certificate. |
| subject\_name | The domain name for which the certificate is issued. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
