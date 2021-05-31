# private-zone

This module creates following resources.

- `aws_route53_zone`
- `aws_route53_vpc_association_authorization` (optional)

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
| [aws_resourcegroups_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/resourcegroups_group) | resource |
| [aws_route53_vpc_association_authorization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_vpc_association_authorization) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the Hosted Zone. | `string` | n/a | yes |
| <a name="input_authorized_cross_account_vpc_associations"></a> [authorized\_cross\_account\_vpc\_associations](#input\_authorized\_cross\_account\_vpc\_associations) | Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `vpc_region` is optional. Defaults to the region of the AWS provider. | `list(map(string))` | `[]` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | A comment for the Hosted Zone. | `string` | `"Managed by Terraform"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_authorized_cross_account_vpc_associations"></a> [authorized\_cross\_account\_vpc\_associations](#output\_authorized\_cross\_account\_vpc\_associations) | A list of authorized VPCs in cross accounts to associate with a private Hosted Zone. |
| <a name="output_comment"></a> [comment](#output\_comment) | A comment for the Hosted Zone. |
| <a name="output_id"></a> [id](#output\_id) | The Hosted Zone ID. This can be referenced by zone records. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Hosted Zone. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_vpc_associations"></a> [vpc\_associations](#output\_vpc\_associations) | A list of associated VPCs with a private Hosted Zone. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
