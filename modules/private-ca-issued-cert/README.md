# private-ca-issued-cert

This module creates following resources.

- `aws_acm_certificate`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.26.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | tedilabs/misc/aws//modules/resource-group | ~> 0.10.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_authority"></a> [certificate\_authority](#input\_certificate\_authority) | (Required) The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority) that will be used to issue the certificate. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Required) A domain name for which the certificate should be issued. FQDN (Fully qualified domain name), such as `www.example.com`, that you want to secure with an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the same domain. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the certificate. | `string` | n/a | yes |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | (Optional) The algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data. RSA is the default key algorithm for ACM certificates. Elliptic Curve Digital Signature Algorithm (ECDSA) keys are smaller, offering security comparable to RSA keys but with greater computing efficiency. However, ECDSA is not supported by all network clients. Some AWS services may require RSA keys, or only support ECDSA keys of a particular size, while others allow the use of either RSA and ECDSA keys to ensure that compatibility is not broken. Supported values are `RSA_1024`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECDSA_P256`, `ECDSA_P384`, `ECDSA_P521`. Defaults to `RSA_2048`. | `string` | `"RSA_2048"` | no |
| <a name="input_module_tags_enabled"></a> [module\_tags\_enabled](#input\_module\_tags\_enabled) | (Optional) Whether to create AWS Resource Tags for the module informations. | `bool` | `true` | no |
| <a name="input_resource_group_description"></a> [resource\_group\_description](#input\_resource\_group\_description) | (Optional) The description of Resource Group. | `string` | `"Managed by Terraform."` | no |
| <a name="input_resource_group_enabled"></a> [resource\_group\_enabled](#input\_resource\_group\_enabled) | (Optional) Whether to create Resource Group to find and group AWS resources which are created by this module. | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. | `string` | `""` | no |
| <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names) | (Optional) A list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the certificate. |
| <a name="output_certificate_authority"></a> [certificate\_authority](#output\_certificate\_authority) | The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority). |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The domain name for which the certificate is issued. |
| <a name="output_effective_date"></a> [effective\_date](#output\_effective\_date) | Effective date and time of the certificate. Start of the validity period of the certificate. |
| <a name="output_expiration_date"></a> [expiration\_date](#output\_expiration\_date) | Expiration date and time of the certificate. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the certificate. |
| <a name="output_key_algorithm"></a> [key\_algorithm](#output\_key\_algorithm) | The algorithm of the public and private key pair to encrypt data. |
| <a name="output_name"></a> [name](#output\_name) | The name of the certificate. |
| <a name="output_status"></a> [status](#output\_status) | Status of the certificate. |
| <a name="output_subject_alternative_names"></a> [subject\_alternative\_names](#output\_subject\_alternative\_names) | The list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate. |
| <a name="output_type"></a> [type](#output\_type) | The type of the certificate. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
