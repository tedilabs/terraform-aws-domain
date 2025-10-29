# amazon-issued-cert

This module creates following resources.

- `aws_acm_certificate`
- `aws_acm_certificate_validation` (Optional)
- `aws_route53_record` (Optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.12.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_acm_certificate_validation.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Required) A domain name for which the certificate should be issued. FQDN (Fully qualified domain name), such as `www.example.com`, that you want to secure with an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the same domain. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the certificate. | `string` | n/a | yes |
| <a name="input_certificate_transparency_logging_enabled"></a> [certificate\_transparency\_logging\_enabled](#input\_certificate\_transparency\_logging\_enabled) | (Optional) Whether to add the certificate to a certificate transparency log. Transparency makes it possible to detect SSL/TLS certificates that have been mistakenly or maliciously issued. Certificates that have not been logged typically produce an error message in a browser. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_dns_validation"></a> [dns\_validation](#input\_dns\_validation) | (Optional) The configuration for the DNS validation. `dns_validation` as defined below.<br/>    (Optional) `enabled` - Whether to process DNS validation by creating the necessary domain records in the module. Defaults to `false`.<br/>    (Optional) `managed_zones` - List of Hosted Zones to automatically manage the records for DNS validation as a map. The key is the name of Hosted Zone. The value is the ID of Hosted Zone. | <pre>object({<br/>    enabled       = optional(bool, false)<br/>    managed_zones = optional(map(string), {})<br/>  })</pre> | `{}` | no |
| <a name="input_email_validation"></a> [email\_validation](#input\_email\_validation) | (Optional) The configuration for the Email validation. `email_validation` as defined below.<br/>    (Optional) `enabled` - Whether to process Email validation by waiting the manual approval. Defaults to `false`. | <pre>object({<br/>    enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_export_enabled"></a> [export\_enabled](#input\_export\_enabled) | (Optional) Whether the certificate can be exported. Defaults to `false`. NOTE: Note Issuing an exportable certificate is subject to additional charges. | `bool` | `false` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | (Optional) The algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data. RSA is the default key algorithm for ACM certificates. Elliptic Curve Digital Signature Algorithm (ECDSA) keys are smaller, offering security comparable to RSA keys but with greater computing efficiency. However, ECDSA is not supported by all network clients. Some AWS services may require RSA keys, or only support ECDSA keys of a particular size, while others allow the use of either RSA and ECDSA keys to ensure that compatibility is not broken. Supported values are `RSA_1024`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECDSA_P256`, `ECDSA_P384`, `ECDSA_P521`. Defaults to `RSA_2048`. | `string` | `"RSA_2048"` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) The region in which to create the module resources. If not provided, the module resources will be created in the provider's configured region. | `string` | `null` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | (Optional) A configurations of Resource Group for this module. `resource_group` as defined below.<br/>    (Optional) `enabled` - Whether to create Resource Group to find and group AWS resources which are created by this module. Defaults to `true`.<br/>    (Optional) `name` - The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. If not provided, a name will be generated using the module name and instance name.<br/>    (Optional) `description` - The description of Resource Group. Defaults to `Managed by Terraform.`. | <pre>object({<br/>    enabled     = optional(bool, true)<br/>    name        = optional(string, "")<br/>    description = optional(string, "Managed by Terraform.")<br/>  })</pre> | `{}` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | (Optional) A set of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. | `set(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_validation_method"></a> [validation\_method](#input\_validation\_method) | (Optional) Which method to use for validation. Valid values are `DNS` or `EMAIL`. Only support `DNS` validation method in this module. | `string` | `"DNS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the certificate. |
| <a name="output_certificate_transparency_logging_enabled"></a> [certificate\_transparency\_logging\_enabled](#output\_certificate\_transparency\_logging\_enabled) | Whether or not the certificate transparency logging is enabled. |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name for which the certificate is issued. |
| <a name="output_effective_date"></a> [effective\_date](#output\_effective\_date) | Effective date and time of the certificate. Start of the validity period of the certificate. |
| <a name="output_expiration_date"></a> [expiration\_date](#output\_expiration\_date) | Expiration date and time of the certificate. |
| <a name="output_export_enabled"></a> [export\_enabled](#output\_export\_enabled) | Whether the certificate can be exported. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the certificate. |
| <a name="output_key_algorithm"></a> [key\_algorithm](#output\_key\_algorithm) | The algorithm of the public and private key pair to encrypt data. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate. |
| <a name="output_region"></a> [region](#output\_region) | The AWS region this module resources resides in. |
| <a name="output_renewal"></a> [renewal](#output\_renewal) | The configuration for the certificate renewal.<br/>    `eligibility` - Whether the certificate is eligible for managed renewal.<br/>    `summary` - The information about the status of ACM's managed renewal for the certificate. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The resource group created to manage resources in this module. |
| <a name="output_status"></a> [status](#output\_status) | Status of the certificate. |
| <a name="output_subject_alternative_names"></a> [subject\_alternative\_names](#output\_subject\_alternative\_names) | The list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. |
| <a name="output_type"></a> [type](#output\_type) | The type of the certificate. |
| <a name="output_validation"></a> [validation](#output\_validation) | The configuration for the certificate validation.<br/>    `method` - The method to use to validate the domain ownership for requesting a public certificate.<br/>    `domain_records` - A map of domain validation records which can be used to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if `validation.method` is `DNS`.<br/>    `emails` - A list of addresses that received a validation E-Mail. Only set if `validation.method` is `EMAIL`. |
<!-- END_TF_DOCS -->
