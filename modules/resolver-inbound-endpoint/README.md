# resolver-inbound-endpoint

This module creates following resources.

- `aws_route53_resolver_endpoint`
- `aws_security_group`
- `aws_security_group_rule`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_assert"></a> [assert](#requirement\_assert) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.12.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | tedilabs/network/aws//modules/security-group | ~> 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_allocations"></a> [ip\_allocations](#input\_ip\_allocations) | (Optional) The configuration for IP allocations of the Route53 Resolver Inbound Endpoint. Select at least two Availability Zone and one subnet for each zone. Each item of `ip_allocations` block as defined below.<br/>    (Required) `subnet` - The ID of the subnet that contains the IP address. You can specify only one subnet per Availability Zone.<br/>    (Optional) `ipv4_address` - IPv4 address from the provided subnet. Defaults to be randomly configured by Amazon.<br/>    (Optional) `ipv6_address` - IPv6 address from the provided subnet. Defaults to be randomly configured by Amazon. | <pre>list(object({<br/>    subnet       = string<br/>    ipv4_address = optional(string)<br/>    ipv6_address = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the Route53 Resolver Inbound Endpoint. | `string` | n/a | yes |
| <a name="input_default_security_group"></a> [default\_security\_group](#input\_default\_security\_group) | (Optional) The configuration of the default security group for the Route53 Resolver Inbound Endpoint. `default_security_group` block as defined below.<br/>    (Optional) `enabled` - Whether to use the default security group. Defaults to `true`.<br/>    (Optional) `name` - The name of the default security group. If not provided, the Route53 Resolver Inbound Endpoint name is used for the name of security group.<br/>    (Optional) `description` - The description of the default security group.<br/>    (Optional) `ingress_rules` - A list of ingress rules in a security group. Defaults to `[]`. Each block of `ingress_rules` as defined below.<br/>      (Required) `id` - The ID of the ingress rule. This value is only used internally within Terraform code.<br/>      (Optional) `description` - The description of the rule.<br/>      (Required) `protocol` - The protocol to match. Note that if `protocol` is set to `-1`, it translates to all protocols, all port ranges, and `from_port` and `to_port` values should not be defined.<br/>      (Required) `from_port` - The start of port range for the protocols.<br/>      (Required) `to_port` - The end of port range for the protocols.<br/>      (Optional) `ipv4_cidrs` - The IPv4 network ranges to allow, in CIDR notation.<br/>      (Optional) `ipv6_cidrs` - The IPv6 network ranges to allow, in CIDR notation.<br/>      (Optional) `prefix_lists` - The prefix list IDs to allow.<br/>      (Optional) `security_groups` - The source security group IDs to allow.<br/>      (Optional) `self` - Whether the security group itself will be added as a source to this ingress rule.<br/>    (Optional) `egress_rules` - A list of egress rules in a security group. Defaults to `[]`. Each block of `egress_rules` as defined below.<br/>      (Required) `id` - The ID of the egress rule. This value is only used internally within Terraform code.<br/>      (Optional) `description` - The description of the rule.<br/>      (Required) `protocol` - The protocol to match. Note that if `protocol` is set to `-1`, it translates to all protocols, all port ranges, and `from_port` and `to_port` values should not be defined.<br/>      (Required) `from_port` - The start of port range for the protocols.<br/>      (Required) `to_port` - The end of port range for the protocols.<br/>      (Optional) `ipv4_cidrs` - The IPv4 network ranges to allow, in CIDR notation.<br/>      (Optional) `ipv6_cidrs` - The IPv6 network ranges to allow, in CIDR notation.<br/>      (Optional) `prefix_lists` - The prefix list IDs to allow.<br/>      (Optional) `security_groups` - The source security group IDs to allow.<br/>      (Optional) `self` - Whether the security group itself will be added as a source to this ingress rule.<br/>    (Optional) `ingress_ipv4_cidrs` - A list of IPv4 CIDR ranges to allow to query to the endpoint. Defaults to `[]`."<br/>    (Optional) `istener_ingress_ipv6_cidrs` - A list of IPv6 CIDR ranges to allow to query to the endpoint. Defaults to `[]`."<br/>    (Optional) `ingress_prefix_lists` - A list of prefix list IDs for AWS services to allow to query to the endpoint. Defaults to `[]`."<br/>    (Optional) `ingress_security_groups` - A list of security group IDs to allow to query to the endpoint. Defaults to `[]`." | <pre>object({<br/>    enabled     = optional(bool, true)<br/>    name        = optional(string)<br/>    description = optional(string, "Managed by Terraform.")<br/>    ingress_rules = optional(<br/>      list(object({<br/>        id              = string<br/>        description     = optional(string, "Managed by Terraform.")<br/>        protocol        = string<br/>        from_port       = number<br/>        to_port         = number<br/>        ipv4_cidrs      = optional(list(string), [])<br/>        ipv6_cidrs      = optional(list(string), [])<br/>        prefix_lists    = optional(list(string), [])<br/>        security_groups = optional(list(string), [])<br/>        self            = optional(bool, false)<br/>      })),<br/>      []<br/>    )<br/>    egress_rules = optional(<br/>      list(object({<br/>        id              = string<br/>        description     = optional(string, "Managed by Terraform.")<br/>        protocol        = string<br/>        from_port       = number<br/>        to_port         = number<br/>        ipv4_cidrs      = optional(list(string), [])<br/>        ipv6_cidrs      = optional(list(string), [])<br/>        prefix_lists    = optional(list(string), [])<br/>        security_groups = optional(list(string), [])<br/>        self            = optional(bool, false)<br/>      })),<br/>      []<br/>    )<br/>    ingress_ipv4_cidrs      = optional(list(string), [])<br/>    ingress_ipv6_cidrs      = optional(list(string), [])<br/>    ingress_prefix_lists    = optional(list(string), [])<br/>    ingress_security_groups = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| <a name="input_delegation_enabled"></a> [delegation\_enabled](#input\_delegation\_enabled) | (Optional) Whether to enable DNS delegation for the Route53 Resolver Inbound Endpoint. If enabled, Route53 Resolver delegates queries to Route 53 private hosted zones from your network. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | (Optional) The type of IP addresses used by the Route53 Resolver Inbound Endpoint. Valid values are `IPV4`, `IPV6`, `DUALSTACK`. Defaults to `IPV4`. | `string` | `"IPV4"` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_protocols"></a> [protocols](#input\_protocols) | (Optional) A set of protocols to use for the Route53 Resolver Inbound Endpoint. The protocols determine how data is transmitted to this endpoint. Valid values are `DoH`, `Do53`, or `DoH-FIPS`. Defaults to `["Do53"]`.<br/>    `Do53`: DNS over port 53. The data is relayed by using the Route 53 Resolver without additional encryption. While the data cannot be read by external parties, it can be viewed within the AWS networks. Uses either UDP or TCP to send the packets. Do53 is primarily used for traffic within and between Amazon VPCs.<br/>    `DoH`: The data is transmitted over an encrypted HTTPS session. DoH adds an added level of security where data can't be decrypted by unauthorized users, and cannot be read by anyone except the intended recipient.<br/>    `DoH-FIPS`: The data is transmitted over an encrypted HTTPS session that is compliant with the FIPS 140-2 cryptographic standard. Supported for inbound endpoints only. For more information, see FIPS PUB 140-2 | `set(string)` | <pre>[<br/>  "Do53"<br/>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) The region in which to create the module resources. If not provided, the module resources will be created in the provider's configured region. | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Optional) A configurations of Resource Group for this module. `resource_group` as defined below.<br/>    (Optional) `enabled` - Whether to create Resource Group to find and group AWS resources which are created by this module. Defaults to `true`.<br/>    (Optional) `name` - The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. If not provided, a name will be generated using the module name and instance name.<br/>    (Optional) `description` - The description of Resource Group. Defaults to `Managed by Terraform.`. | <pre>object({<br/>    enabled     = optional(bool, true)<br/>    name        = optional(string, "")<br/>    description = optional(string, "Managed by Terraform.")<br/>  })</pre> | `{}` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | (Optional) A list of security group IDs to assign to the Route53 Resolver Inbound Endpoint. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the Route53 Resolver Endpoint. |
| <a name="output_default_security_group"></a> [default\_security\_group](#output\_default\_security\_group) | The default security group ID of the Route53 Resolver Endpoint. |
| <a name="output_delegation_enabled"></a> [delegation\_enabled](#output\_delegation\_enabled) | Whether delegation is enabled for the Route53 Resolver Inbound Endpoint. |
| <a name="output_direction"></a> [direction](#output\_direction) | The direction of DNS queries to or from the Route 53 Resolver endpoint. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Route53 Resolver Endpoint. |
| <a name="output_ip_address_type"></a> [ip\_address\_type](#output\_ip\_address\_type) | The type of IP addresses used by the Route53 Resolver Inbound Endpoint. |
| <a name="output_ip_allocations"></a> [ip\_allocations](#output\_ip\_allocations) | The configuration for IP allocations of the Route53 Resolver Inbound Endpoint. |
| <a name="output_ipv4_addresses"></a> [ipv4\_addresses](#output\_ipv4\_addresses) | A set of IPv4 addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs. |
| <a name="output_ipv6_addresses"></a> [ipv6\_addresses](#output\_ipv6\_addresses) | A set of IPv6 addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Route53 Resolver Endpoint. |
| <a name="output_protocols"></a> [protocols](#output\_protocols) | A set of protocols to use for the Route53 Resolver Inbound Endpoint. |
| <a name="output_region"></a> [region](#output\_region) | The AWS region this module resources resides in. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The resource group created to manage resources in this module. |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | A set of security group IDs which is assigned to the Route53 Resolver Endpoint. |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | A set of the ID of subnets that IP addresses of resolver endpoint are allocated in. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC that you want to create the resolver endpoint in. |
<!-- END_TF_DOCS -->
