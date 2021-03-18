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

variable "authorized_cross_account_vpc_associations" {
  description = "Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `vpc_region` is optional. Defaults to the region of the AWS provider."
  type        = list(map(string))
  default     = []
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
