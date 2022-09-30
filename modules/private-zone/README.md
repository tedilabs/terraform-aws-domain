# private-zone

This module creates following resources.

- `aws_route53_zone`
- `aws_route53_zone_vpc_association` (optional)
- `aws_route53_vpc_association_authorization` (optional)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.27 |

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
| [aws_route53_vpc_association_authorization.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_vpc_association_authorization) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone_association.secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Hosted Zone. | `string` | n/a | yes |
| <a name="input_authorized_cross_account_vpc_associations"></a> [authorized\_cross\_account\_vpc\_associations](#input\_authorized\_cross\_account\_vpc\_associations) | (Optional) Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider. | `list(map(string))` | `[]` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | (Optional) A comment for the Hosted Zone. | `string` | `"Managed by Terraform"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) The namespace of the Hosted Zone. Just for categorising overlapped hosted zones. | `string` | `"default"` | no |
| <a name="input_primary_vpc_association"></a> [primary\_vpc\_association](#input\_primary\_vpc\_association) | (Required) The Primary VPC to associate with the private hosted zone. `vpc_id` is required to associate with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider. `primary_vpc_association` block as defined below.<br>    (Required) `vpc_id` - The ID of the VPC to associate with the private Hosted Zone.<br>    (Optional) `region` - The region of the VPC to associate. Defaults to the region of the AWS provider. | `map(string)` | `{}` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | (Optional) The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | (Optional) Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_secondary_vpc_associations"></a> [secondary\_vpc\_associations](#input\_secondary\_vpc\_associations) | (Optional) A list of secondary VPCs to associate with the private hosted zone. `vpc_id` is required to associate with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider. | `list(map(string))` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the Hosted Zone. |
| <a name="output_authorized_cross_account_vpc_associations"></a> [authorized\_cross\_account\_vpc\_associations](#output\_authorized\_cross\_account\_vpc\_associations) | A list of authorized VPCs in cross accounts to associate with a private Hosted Zone. |
| <a name="output_comment"></a> [comment](#output\_comment) | A comment for the Hosted Zone. |
| <a name="output_id"></a> [id](#output\_id) | The Hosted Zone ID. This can be referenced by zone records. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Hosted Zone. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace of the Hosted Zone. |
| <a name="output_vpc_associations"></a> [vpc\_associations](#output\_vpc\_associations) | A list of associated VPCs with a private Hosted Zone. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
