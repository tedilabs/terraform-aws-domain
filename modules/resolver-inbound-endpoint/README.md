# resolver-inbound-endpoint

This module creates following resources.

- `aws_route53_resolver_endpoint`
- `aws_security_group`
- `aws_security_group_rule`

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group__this"></a> [security\_group\_\_this](#module\_security\_group\_\_this) | tedilabs/network/aws//modules/security-group | 0.20.0 |

## Resources

| Name | Type |
|------|------|
| [aws_resourcegroups_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/resourcegroups_group) | resource |
| [aws_route53_resolver_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_allocations"></a> [ip\_allocations](#input\_ip\_allocations) | A list of IP allocations which include `subnet_id` and `ip`. `ip` is a private IP from `subnet`. | <pre>list(object({<br>    subnet_id = string<br>    ip        = string<br>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Route53 Resolver Inbound Endpoint. | `string` | n/a | yes |
| <a name="input_allowed_ingress_cidrs"></a> [allowed\_ingress\_cidrs](#input\_allowed\_ingress\_cidrs) | A list of CIDR for Route53 Resolver Inbound Endpoint ingress access. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | A list of security groups for Route53 Resolver Inbound Endpoint. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Route 53 Resolver Endpoint. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Route 53 Resolver Endpoint. |
| <a name="output_ip_addresses"></a> [ip\_addresses](#output\_ip\_addresses) | IP addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Route 53 Resolver Endpoint. |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | A list of the ID of security groups that you want to use to control access to this VPC. |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | A list of the ID of subnets that IP addresses of resolver endpoint are allocated in. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC that you want to create the resolver endpoint in. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
