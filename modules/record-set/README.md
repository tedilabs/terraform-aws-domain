# record-set

This module creates following resources.

- `aws_route53_record` (optional)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the record. Enter a fully qualified domain name, for example, `www.example.com`. You can use the asterisk (*) wildcard to replace the leftmost label in a domain name, for example, `*.example.com`. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | (Required) The DNS record type. Valid values are `A`, `AAAA`, `CAA`, `CNAME`, `DS`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV` and `TXT`. | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | (Required) The ID of the hosted zone to contain this record set. | `string` | n/a | yes |
| <a name="input_overwrite"></a> [overwrite](#input\_overwrite) | (Optional) Whether to allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. This configuration is not recommended for most environments. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_records"></a> [records](#input\_records) | (Optional) A list of records for the record set. Each item of `records` as defined below.<br>    (Optional) `id` - A unique ID to differentiate this record from other records with the same domain name and type. Not required if the `routing_policy` is `SIMPLE`. Defaults to `default`.<br>    (Optional) `value` - A configuration for non-alias record with a list of the record values. You can specify more than one value for all record types except `CNAME` and `SOA`. Conflicts with `alias`.<br>    (Optional) `alias` - A configuration for alias record. Conflicts with `value`. `alias` as defined below.<br>      (Required) `name` - DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another record set in this hosted zone.<br>      (Required) `zone` - Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.<br>      (Optional) `evaluate_target_health` - Whether to respond to DNS queries using this record by checking the health of the alias target. Some resources have special requirements, see related part of documentation. Defaults to `true`. | <pre>list(object({<br>    id    = optional(string, "default")<br>    value = optional(list(string))<br>    alias = optional(object({<br>      name                   = string<br>      zone                   = string<br>      evaluate_target_health = optional(bool, true)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_routing_policy"></a> [routing\_policy](#input\_routing\_policy) | (Optional) The routing policy determines how Route 53 responds to queries. Defaults to `SIMPLE`. Supported routing policies are following:<br>    `SIMPLE`<br>    `WEIGHTED`<br>    `GEOLOCATION`<br>    `LATENCY`<br>    `FAILOVER`<br>    `MULTIVALUE_ANSWER`<br>    `CIDR`<br>    `GEOPROXIMITY` | `string` | `"SIMPLE"` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Optional) The record cache time to live (TTL) in seconds. Defaults to `300`.<br>    - If you're creating or updating an alias record set, omit `ttl`. Route 53 uses the value of TTL for the alias target.<br>    - If you're associating this record set with a health check, we recommend that you specify a `ttl` of `60` seconds or less so clients respond quickly to changes in health status.<br>    - All of the records in a group of weighted record sets must have the same value for `ttl`.<br>    - If a group of weighted record sets includes one or more weighted alias records for which the alias target is an ELB load balancer, we recommend that you specify a `ttl` of `60` seconds for all of the non-alias weighted records that have the same name and type. Values other than `60` seconds (the TTL for load balancers) will change the effect of the values that you specify for weight. | `number` | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN (Fully-qualified Domain Name) of the record. |
| <a name="output_name"></a> [name](#output\_name) | The name of the record. |
| <a name="output_records"></a> [records](#output\_records) | A list of records for the record set. Each item of `records` as defined below.<br>    `id` - A unique ID to differentiate this record from other records with the same domain name and type.<br>    `value` - A configuration for non-alias record with a list of the record values.<br>    `alias` - A configuration for alias record. Conflicts with `value`. `alias` as defined below.<br>      `name` - DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another record set in this hosted zone.<br>      `zone` - Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.<br>      `evaluate_target_health` - Whether to respond to DNS queries using this record by checking the health of the alias target. |
| <a name="output_routing_policy"></a> [routing\_policy](#output\_routing\_policy) | The routing policy of the record set. |
| <a name="output_ttl"></a> [ttl](#output\_ttl) | The record cache time to live (TTL) in seconds. |
| <a name="output_type"></a> [type](#output\_type) | The DNS record type of the record set. |
| <a name="output_zone"></a> [zone](#output\_zone) | The information for Hosted Zone of the record set. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
