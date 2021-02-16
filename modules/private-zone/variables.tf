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

variable "cross_account_vpc_associations" {
  description = "Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `vpc_region` is optional. Defaults to the region of the AWS provider."
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
