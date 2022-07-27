variable "name" {
  description = "(Required) The name of the Hosted Zone."
  type        = string
}

variable "namespace" {
  description = "(Optional) The namespace of the Hosted Zone. Just for categorising overlapped hosted zones."
  type        = string
  default     = "default"
  nullable    = false
}

variable "comment" {
  description = "(Optional) A comment for the Hosted Zone."
  type        = string
  default     = "Managed by Terraform"
  nullable    = false
}

variable "force_destroy" {
  description = "(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  type        = bool
  default     = false
  nullable    = false
}

variable "authorized_cross_account_vpc_associations" {
  description = "(Optional) Authorizes a VPC in a peer account to be associated with a local Route53 Hosted Zone. `vpc_id` is required to authorize for association with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider."
  type        = list(map(string))
  default     = []
  nullable    = false
}

variable "primary_vpc_association" {
  description = "(Optional) The Primary VPC to associate with the private hosted zone. `vpc_id` is required to associate with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "secondary_vpc_associations" {
  description = "(Optional) A list of secondary VPCs to associate with the private hosted zone. `vpc_id` is required to associate with the private Hosted Zone. `region` is optional. Defaults to the region of the AWS provider."
  type        = list(map(string))
  default     = []
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

variable "resource_group_enabled" {
  description = "(Optional) Whether to create Resource Group to find and group AWS resources which are created by this module."
  type        = bool
  default     = true
  nullable    = false
}

variable "resource_group_name" {
  description = "(Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`."
  type        = string
  default     = ""
  nullable    = false
}

variable "resource_group_description" {
  description = "(Optional) The description of Resource Group."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}
