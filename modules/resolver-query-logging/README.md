# resolver-query-logging

This module creates following resources.

- `aws_route53_resolver_query_log_config`
- `aws_route53_resolver_query_log_config_association` (optional)

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
| [aws_route53_resolver_query_log_config.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config) | resource |
| [aws_route53_resolver_query_log_config_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_arn"></a> [destination\_arn](#input\_destination\_arn) | (Required) The ARN of the resource that you want Route 53 Resolver to send query logs. You can send query logs to an S3 bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery stream. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Route 53 Resolver query logging configuration. | `string` | n/a | yes |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | (Optional) The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | (Optional) Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_ids"></a> [vpc\_ids](#input\_vpc\_ids) | (Optional) List of VPC IDs that you want this query logging configuration to log queries for. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Route 53 Resolver query logging configuration. |
| <a name="output_destination_arn"></a> [destination\_arn](#output\_destination\_arn) | The ARN of the resource that Route 53 Resolver send query logs. This can be S3 bucket, CloudWatch Logs log group, or Kinesis Data Firehose delivery stream. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Route 53 Resolver query logging configuration. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Route 53 Resolver query logging configuration. |
| <a name="output_owner_id"></a> [owner\_id](#output\_owner\_id) | The AWS Account ID the account that created the query logging configuration. |
| <a name="output_share_status"></a> [share\_status](#output\_share\_status) | An indication of whether the query logging configuration is shared with other AWS accounts, or was shared with the current account by another AWS account. Sharing is configured through AWS Resource Access Manager (AWS RAM). Values are `NOT_SHARED`, `SHARED_BY_ME` or `SHARED_WITH_ME`. |
| <a name="output_vpc_ids"></a> [vpc\_ids](#output\_vpc\_ids) | A list of associated VPC IDs to query logging configuration. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
