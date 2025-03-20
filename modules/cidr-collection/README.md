# cidr-collection

This module creates following resources.

- `aws_route53_cidr_collection`
- `aws_route53_cidr_location` (optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_cidr_collection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_collection) | resource |
| [aws_route53_cidr_location.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_location) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name for the CIDR collection. | `string` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | (Optional) A configurations for locations of the CIDR collection. Each key is the CIDR location name. Each value is a set of the location CIDR blocks. | `map(set(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the CIDR collection. |
| <a name="output_id"></a> [id](#output\_id) | The CIDR collection ID. |
| <a name="output_locations"></a> [locations](#output\_locations) | A map of locations for the CIDR collection. |
| <a name="output_name"></a> [name](#output\_name) | The name of the CIDR collection. |
| <a name="output_version"></a> [version](#output\_version) | The version of the CIDR collection. |
<!-- END_TF_DOCS -->
