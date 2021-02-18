# public-zone

This module creates following resources.

- `aws_route53_zone`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.27 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.27 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the Hosted Zone. | `string` | n/a | yes |
| comment | A comment for the Hosted Zone. | `string` | `"Managed by Terraform"` | no |
| delegation\_set\_id | The ID of the reusable delegation set whose NS records you want to assign to the Hosted Zone. | `string` | `null` | no |
| force\_destroy | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| comment | A comment for the Hosted Zone. |
| delegation\_set\_id | The ID of the assigned delegation set. |
| id | The Hosted Zone ID. This can be referenced by zone records. |
| name | The name of the Hosted Zone. |
| name\_servers | A list of name servers in associated (or default) delegation set. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
