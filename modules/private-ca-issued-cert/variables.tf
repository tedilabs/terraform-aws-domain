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
  description = "(Optional) A list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "early_renewal_duration" {
  description = "(Optional) Amount of time to start automatic renewal process before expiration. Has no effect if less than 60 days. Represented by either a subset of RFC 3339 duration supporting years, months, and days (e.g., `P90D`), or a string such as `2160h`."
  type        = string
  default     = null
  nullable    = true
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
