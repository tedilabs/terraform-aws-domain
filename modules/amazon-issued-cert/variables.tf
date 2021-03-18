variable "name" {
  description = "The name of the certificate."
  type        = string
  default     = ""
}

variable "subject_name" {
  description = "A domain name for which the certificate should be issued."
  type        = string
}

variable "subject_alternative_names" {
  description = "List of domains that should be SANs in the issued certificate. To remove all elements of a previously configured list, set this value equal to an empty list (`[]`) or use the `terraform taint` command to trigger recreation."
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Which method to use for validation. `DNS` or `EMAIL` are valid, `NONE` can be used for certificates that were imported into ACM and then into Terraform."
  type        = string
  default     = "DNS"
}

variable "validation_dns_managed" {
  description = "Specifies whether validation should be managed by the module when `validation_method` is `DNS`."
  type        = bool
  default     = false
}

variable "validation_dns_managed_zones" {
  description = "List of Hosted Zones to automatically manage the records for DNS validation as a map. The key is the name of Hosted Zone. The value is the ID of Hosted Zone."
  type        = map(string)
  default     = {}
}

variable "certificate_transparency_logging_enabled" {
  description = "Specifies whether certificate details should be added to a certificate transparency log."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "module_tags_enabled" {
  description = "Whether to create AWS Resource Tags for the module informations."
  type        = bool
  default     = true
}


###################################################
# Resource Group
###################################################

variable "resource_group_enabled" {
  description = "Whether to create Resource Group to find and group AWS resources which are created by this module."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`."
  type        = string
  default     = ""
}

variable "resource_group_description" {
  description = "The description of Resource Group."
  type        = string
  default     = "Managed by Terraform."
}
