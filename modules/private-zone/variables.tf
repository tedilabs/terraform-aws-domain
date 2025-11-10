variable "name" {
  description = "(Required) The name of the Hosted Zone."
  type        = string
  nullable    = false
}

variable "namespace" {
  description = "(Optional) The namespace of the Hosted Zone. Just for categorising overlapped hosted zones. Defaults to `default`."
  type        = string
  default     = "default"
  nullable    = false
}

variable "description" {
  description = "(Optional) A description for the Hosted Zone."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}

variable "force_destroy" {
  description = "(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. Defaults to `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "cross_account_vpc_association_authorizations" {
  description = <<EOF
  (Optional) A list of authorizations for a VPC in a peer account to be associated with the Route53 Hosted Zone. Each block of `cross_account_vpc_association_authorizations` as defined below.
    (Required) `vpc_id` - The ID of the VPC to authorize for association with the private Hosted Zone.
    (Optional) `region` - The region of the VPC to authorize. Defaults to the region of the AWS provider.
  EOF
  type = list(object({
    region = optional(string)
    vpc_id = string
  }))
  default  = []
  nullable = false
}

variable "primary_vpc_association" {
  description = <<EOF
  (Required) The Primary VPC to associate with the private hosted zone. `primary_vpc_association` block as defined below.
    (Required) `vpc_id` - The ID of the VPC to associate with the private Hosted Zone.
    (Optional) `region` - The region of the VPC to associate. Defaults to the region of the AWS provider.
  EOF
  type = object({
    region = optional(string)
    vpc_id = string
  })
  nullable = false
}

variable "secondary_vpc_associations" {
  description = <<EOF
  (Optional) A list of secondary VPCs to associate with the private hosted zone. Each
  block of `secondary_vpc_associations` as defined below.
    (Required) `vpc_id` - The ID of the VPC to associate with the private Hosted Zone.
    (Optional) `region` - The region of the VPC to associate. Defaults to the region of the AWS provider.
  EOF
  type = list(object({
    region = optional(string)
    vpc_id = string
  }))
  default  = []
  nullable = false
}

variable "profile_associations" {
  description = <<EOF
  (Optional) A list of configurations to associate Route53 Profiles with the Hosted Zone. Each block of `profile_associations` as defined below.
    (Required) `name` - The name of the resource association with the Route53 profile.
    (Optional) `region` - The region of the Route53 profile. Defaults to the region of the AWS provider.
    (Required) `profile` - The ID of the Route53 profile to associate with.
  EOF
  type = list(object({
    name    = string
    region  = optional(string)
    profile = string
  }))
  default  = []
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
