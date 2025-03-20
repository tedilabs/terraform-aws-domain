# public-zone

This module creates following resources.

- `aws_route53_zone`
- `aws_route53_query_log` (optional)
- `aws_route53_record` (optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.51 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.10.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_query_log.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_query_log) | resource |
| [aws_route53_record.ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Hosted Zone. | `string` | n/a | yes |
| <a name="input_delegation_set"></a> [delegation\_set](#input\_delegation\_set) | (Optional) The ID of the reusable delegation set whose NS records you want to assign to the Hosted Zone. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description for the Hosted Zone. | `string` | `"Managed by Terraform."` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | (Optional) The configuration of Route53 query logging. `logging` as defined below.<br>    (Optional) `cloudwatch` - A configuration to define where the execution history events are logged. `cloudwatch` as defined below.<br>      (Optional) `enabled` - Whether to enable or disable Route53 query logging.<br>      (Optional) `log_group` - The ARN (Amazon Resource Name) of the CloudWatch Log Group. The CloudWatch log group must be in the `us-east-1` region. A permissive CloudWatch log resource policy must be in place. | <pre>object({<br>    cloudwatch = optional(object({<br>      enabled   = optional(bool, false)<br>      log_group = optional(string, "")<br>    }), {})<br>  })</pre> | `{}` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) The namespace of the Hosted Zone. Just for categorising overlapped hosted zones. Defaults to `default`. | `string` | `"default"` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | (Optional) A map of `NS` records for the zone. Each key of the map is the record name. Each value of `ns_records` as defined below.<br>    (Required) `values` - A list of the record values<br>    (Optional) `ttl` - The TTL of the record. Defaults to `300`. | <pre>map(object({<br>    values = list(string)<br>    ttl    = optional(number, 300)<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | (Optional) The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | (Optional) Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the Hosted Zone. |
| <a name="output_delegation_set"></a> [delegation\_set](#output\_delegation\_set) | The ID of the assigned delegation set. |
| <a name="output_description"></a> [description](#output\_description) | A description for the Hosted Zone. |
| <a name="output_id"></a> [id](#output\_id) | The Hosted Zone ID. This can be referenced by zone records. |
| <a name="output_logging"></a> [logging](#output\_logging) | A configuration for query logging of the Route53 Hosted Zone.<br>    `cloudwatch` - The configuration for Route53 query logs to CloudWatch Logs. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Hosted Zone. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace of the Hosted Zone. |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | A map of `NS` records for the zone. Each key of the map is the record name.<br>    `values` - A list of the record values<br>    `ttl` - The TTL of the record. |
| <a name="output_primary_name_server"></a> [primary\_name\_server](#output\_primary\_name\_server) | The Route 53 name server that created the SOA record. |
<!-- END_TF_DOCS -->
