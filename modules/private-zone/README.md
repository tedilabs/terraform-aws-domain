# private-zone

This module creates following resources.

- `aws_route53_zone`
- `aws_route53_vpc_association_authorization` (optional)

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
| authorized\_cross\_account\_vpc\_associations | Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `vpc_region` is optional. Defaults to the region of the AWS provider. | `list(map(string))` | `[]` | no |
| comment | A comment for the Hosted Zone. | `string` | `"Managed by Terraform"` | no |
| force\_destroy | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| authorized\_cross\_account\_vpc\_associations | A list of authorized VPCs in cross accounts to associate with a private Hosted Zone. |
| comment | A comment for the Hosted Zone. |
| id | The Hosted Zone ID. This can be referenced by zone records. |
| name | The name of the Hosted Zone. |
| name\_servers | A list of name servers in associated (or default) delegation set. |
| vpc\_associations | A list of associated VPCs with a private Hosted Zone. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
