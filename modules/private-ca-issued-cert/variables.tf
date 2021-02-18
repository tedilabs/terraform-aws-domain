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

variable "certificate_authority_arn" {
  description = "The ARN of an ACMPCA."
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
