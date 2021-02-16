variable "name" {
  description = "The name of the Hosted Zone."
  type        = string
}

variable "comment" {
  description = "A comment for the Hosted Zone."
  type        = string
  default     = "Managed by Terraform"
}

variable "force_destroy" {
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  type        = bool
  default     = false
}

variable "delegation_set_id" {
  description = "The ID of the reusable delegation set whose NS records you want to assign to the Hosted Zone."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
