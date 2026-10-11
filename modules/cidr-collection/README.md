# cidr-collection

This module creates following resources.

- `aws_route53_cidr_collection`
- `aws_route53_cidr_location` (optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.12 |
| <a name="requirement_telemetry"></a> [telemetry](#requirement\_telemetry) | >= 0.2.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.12 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_route53_cidr_collection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_collection) | resource |
| [aws_route53_cidr_location.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_cidr_location) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name for the CIDR collection. | `string` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | (Optional) A configurations for locations of the CIDR collection. Each key is the CIDR location name. Each value is a set of the location CIDR blocks. | `map(set(string))` | `{}` | no |
| <a name="input_telemetry"></a> [telemetry](#input\_telemetry) | (Optional) A configuration to collect telemetry data for the module. This is used to improve the module and its features. To send pseudonyms instead of identifying values such as the hostname and the Git remote, set `pseudonymization_enabled` to `true`. Pseudonyms are not anonymous; to keep data from being sent, disable its collector. The default configuration enables telemetry collection for machine, network, git, github, github actions, HCP Terraform, terraform, and toolchain. You can disable telemetry collection by setting `enabled` to `false`. `telemetry` block as defined below.<br/>    (Optional) `enabled` - Whether to enable telemetry collection. Default is `true`.<br/>    (Optional) `capture_machine` - Whether to capture machine information. Default is `true`.<br/>    (Optional) `capture_network` - Whether to capture network information. Default is `true`.<br/>    (Optional) `capture_git` - Whether to capture git information. Default is `true`.<br/>    (Optional) `capture_github` - Whether to capture GitHub information. Default is `true`.<br/>    (Optional) `capture_github_actions` - Whether to capture GitHub Actions information. Default is `true`.<br/>    (Optional) `capture_hcp_terraform` - Whether to capture HCP Terraform information. Default is `true`.<br/>    (Optional) `capture_terraform` - Whether to capture Terraform information. Default is `true`.<br/>    (Optional) `capture_toolchain` - Whether to capture toolchain information. Default is `true`.<br/>    (Optional) `pseudonymization_enabled` - Whether to enable pseudonymization of the captured data. Default is `false`. | <pre>object({<br/>    enabled = optional(bool, true)<br/><br/>    capture_machine        = optional(bool, true)<br/>    capture_network        = optional(bool, true)<br/>    capture_git            = optional(bool, true)<br/>    capture_github         = optional(bool, true)<br/>    capture_github_actions = optional(bool, true)<br/>    capture_hcp_terraform  = optional(bool, true)<br/>    capture_terraform      = optional(bool, true)<br/>    capture_toolchain      = optional(bool, true)<br/><br/>    pseudonymization_enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the CIDR collection. |
| <a name="output_id"></a> [id](#output\_id) | The CIDR collection ID. |
| <a name="output_locations"></a> [locations](#output\_locations) | A map of locations for the CIDR collection. |
| <a name="output_name"></a> [name](#output\_name) | The name of the CIDR collection. |
| <a name="output_version"></a> [version](#output\_version) | The version of the CIDR collection. |
<!-- END_TF_DOCS -->
