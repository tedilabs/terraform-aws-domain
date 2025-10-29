variable "region" {
  description = "(Optional) The region in which to create the module resources. If not provided, the module resources will be created in the provider's configured region."
  type        = string
  default     = null
  nullable    = true
}

variable "name" {
  description = "(Required) The name of the certificate."
  type        = string
  nullable    = false
}

variable "domain_name" {
  description = "(Required) A domain name for which the certificate should be issued. FQDN (Fully qualified domain name), such as `www.example.com`, that you want to secure with an ACM certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the same domain."
  type        = string
  nullable    = false
}

variable "subject_alternative_names" {
  description = "(Optional) A set of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate."
  type        = set(string)
  default     = []
  nullable    = false
}

variable "key_algorithm" {
  description = "(Optional) The algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data. RSA is the default key algorithm for ACM certificates. Elliptic Curve Digital Signature Algorithm (ECDSA) keys are smaller, offering security comparable to RSA keys but with greater computing efficiency. However, ECDSA is not supported by all network clients. Some AWS services may require RSA keys, or only support ECDSA keys of a particular size, while others allow the use of either RSA and ECDSA keys to ensure that compatibility is not broken. Supported values are `RSA_1024`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECDSA_P256`, `ECDSA_P384`, `ECDSA_P521`. Defaults to `RSA_2048`."
  type        = string
  default     = "RSA_2048"
  nullable    = false

  validation {
    condition     = contains(["RSA_1024", "RSA_2048", "RSA_3072", "RSA_4096", "ECDSA_P256", "ECDSA_P384", "ECDSA_P521"], var.key_algorithm)
    error_message = "Valid values for `key_algorithm` are `RSA_1024`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECDSA_P256`, `ECDSA_P384`, `ECDSA_P521`."
  }
}

variable "certificate_transparency_logging_enabled" {
  description = "(Optional) Whether to add the certificate to a certificate transparency log. Transparency makes it possible to detect SSL/TLS certificates that have been mistakenly or maliciously issued. Certificates that have not been logged typically produce an error message in a browser. Defaults to `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "export_enabled" {
  description = "(Optional) Whether the certificate can be exported. Defaults to `false`. NOTE: Note Issuing an exportable certificate is subject to additional charges."
  type        = bool
  default     = false
  nullable    = false
}

variable "validation_method" {
  description = "(Optional) Which method to use for validation. Valid values are `DNS` or `EMAIL`. Only support `DNS` validation method in this module."
  type        = string
  default     = "DNS"
  nullable    = false

  validation {
    condition     = contains(["DNS"], var.validation_method)
    error_message = "Valid values for `validation_method` are `DNS`."
  }
}

variable "dns_validation" {
  description = <<EOF
  (Optional) The configuration for the DNS validation. `dns_validation` as defined below.
    (Optional) `enabled` - Whether to process DNS validation by creating the necessary domain records in the module. Defaults to `false`.
    (Optional) `managed_zones` - List of Hosted Zones to automatically manage the records for DNS validation as a map. The key is the name of Hosted Zone. The value is the ID of Hosted Zone.
  EOF
  type = object({
    enabled       = optional(bool, false)
    managed_zones = optional(map(string), {})
  })
  default  = {}
  nullable = false
}

variable "email_validation" {
  description = <<EOF
  (Optional) The configuration for the Email validation. `email_validation` as defined below.
    (Optional) `enabled` - Whether to process Email validation by waiting the manual approval. Defaults to `false`.
  EOF
  type = object({
    enabled = optional(bool, false)
  })
  default  = {}
  nullable = false
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "module_tags_enabled" {
  description = "(Optional) Whether to create AWS Resource Tags for the module informations."
  type        = bool
  default     = true
  nullable    = false
}


###################################################
# Resource Group
###################################################

variable "resource_group" {
  description = <<EOF
  (Optional) A configurations of Resource Group for this module. `resource_group` as defined below.
    (Optional) `enabled` - Whether to create Resource Group to find and group AWS resources which are created by this module. Defaults to `true`.
    (Optional) `name` - The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`. If not provided, a name will be generated using the module name and instance name.
    (Optional) `description` - The description of Resource Group. Defaults to `Managed by Terraform.`.
  EOF
  type = object({
    enabled     = optional(bool, true)
    name        = optional(string, "")
    description = optional(string, "Managed by Terraform.")
  })
  default  = {}
  nullable = false
}
