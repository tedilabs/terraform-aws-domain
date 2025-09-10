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
  description = "(Optional) A list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate."
  type        = list(string)
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

variable "certificate_authority" {
  description = "(Required) The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority) that will be used to issue the certificate."
  type        = string
  nullable    = false
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
