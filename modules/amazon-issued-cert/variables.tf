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
