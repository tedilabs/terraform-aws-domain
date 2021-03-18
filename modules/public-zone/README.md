# public-zone

This module creates following resources.

- `aws_route53_zone`

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
| name | The name of the Hosted Zone. | `string` | n/a | yes |
| comment | A comment for the Hosted Zone. | `string` | `"Managed by Terraform"` | no |
| delegation\_set\_id | The ID of the reusable delegation set whose NS records you want to assign to the Hosted Zone. | `string` | `null` | no |
| force\_destroy | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| module\_tags\_enabled | Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| resource\_group\_description | The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| resource\_group\_enabled | Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| resource\_group\_name | The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| comment | A comment for the Hosted Zone. |
| delegation\_set\_id | The ID of the assigned delegation set. |
| id | The Hosted Zone ID. This can be referenced by zone records. |
| name | The name of the Hosted Zone. |
| name\_servers | A list of name servers in associated (or default) delegation set. |
| resource\_group\_enabled | Whether Resource Group is enabled. |
| resource\_group\_name | The name of Resource Group. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
