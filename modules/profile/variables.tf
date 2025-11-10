variable "region" {
  description = "(Optional) The region in which to create the module resources. If not provided, the module resources will be created in the provider's configured region."
  type        = string
  default     = null
  nullable    = true
}

variable "name" {
  description = "(Required) The name of the Route53 Profile."
  type        = string
  nullable    = false
}

variable "resource_associations" {
  description = <<EOF
  (Optional) A list of Route53 resource associations for the Profile. Each value of `resource_associations` as defined below.
    (Required) `name` - The name of the Profile Resource Association.
    (Required) `resource_arn` - The ARN of the resource to be associated with the profile.
    (Optional) `resource_properties` - Resource properties for the resource to be associated with the profile.
    (Optional) `timeouts` - A configuration of timeouts for the resource association. `timeouts` as defined below.
      (Optional) `create` - Timeout for creating the resource association.
      (Optional) `delete` - Timeout for deleting the resource association.
  EOF
  type = list(object({
    name                = string
    resource_arn        = string
    resource_properties = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for association in var.resource_associations :
      can(regex("^(?![0-9]+$)([a-zA-Z0-9\\-_' ']+)$", association.name))
    ])
    error_message = "Resource association names must match the regex pattern: (?!^[0-9]+$)([a-zA-Z0-9\\-_' ']+)"
  }
}

variable "timeouts" {
  description = <<EOF
  (Optional) How long to wait for the Profile to be created/read/deleted.
  EOF
  type = object({
    create = optional(string, "30m")
    read   = optional(string, "30m")
    delete = optional(string, "30m")
  })
  default  = {}
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


###################################################
# Resource Sharing by RAM (Resource Access Manager)
###################################################

variable "shares" {
  description = "(Optional) A list of resource shares via RAM (Resource Access Manager)."
  type = list(object({
    name = optional(string)

    permissions = optional(set(string), ["AWSRAMPermissionRoute53ProfileAllowAssociation"])

    external_principals_allowed = optional(bool, false)
    principals                  = optional(set(string), [])

    tags = optional(map(string), {})
  }))
  default  = []
  nullable = false
}
