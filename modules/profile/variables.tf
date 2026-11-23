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

variable "resolver_query_log_configurations" {
  description = <<EOF
  (Optional) A list of configurations to associate Route53 Resolver query logging configurations with the Profile. Each block of `resolver_query_log_configurations` as defined below.
    (Required) `name` - The name of the resource association with the query logging configuration.
    (Required) `resolver_query_log_configuration` - The ARN of the Route53 Resolver query logging configuration to associate with.
  EOF
  type = list(object({
    name                             = string
    resolver_query_log_configuration = string
  }))
  default  = []
  nullable = false
}

variable "dns_firewall_rule_groups" {
  description = <<EOF
  (Optional) A list of configurations to associate Route53 Resolver DNS Firewall rule groups with the Profile. Each block of `dns_firewall_rule_groups` as defined below.
    (Required) `name` - The name of the resource association with the DNS Firewall rule group.
    (Required) `dns_firewall_rule_group` - The ARN of the Route53 Resolver DNS Firewall rule group to associate with.
    (Required) `priority` - The setting that determines the processing order of the rule group among the rule groups associated with the Profile. DNS Firewall filters VPC traffic starting from the rule group with the lowest numeric priority setting. Valid values are between `100` and `9900`.
  EOF
  type = list(object({
    name                    = string
    dns_firewall_rule_group = string
    priority                = number
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for rule_group in var.dns_firewall_rule_groups :
      rule_group.priority >= 100 && rule_group.priority <= 9900
    ])
    error_message = "Valid values for `priority` are between `100` and `9900`."
  }
}

variable "resolver_rules" {
  description = <<EOF
  (Optional) A list of configurations to associate Route53 Resolver rules with the Profile. Each block of `resolver_rules` as defined below.
    (Required) `name` - The name of the resource association with the Resolver rule.
    (Required) `resolver_rule` - The ARN of the Route53 Resolver rule to associate with.
  EOF
  type = list(object({
    name          = string
    resolver_rule = string
  }))
  default  = []
  nullable = false
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
  description = "(Optional) Whether to create AWS Resource Tags for the module information."
  type        = bool
  default     = true
  nullable    = false
}


###################################################
# Resource Group
###################################################

variable "resource_group" {
  description = <<EOF
  (Optional) A configuration of Resource Group for this module. `resource_group` as defined below.
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
  description = <<EOF
  (Optional) A list of resource shares via RAM (Resource Access Manager). Each block of `shares` as defined below.
    (Required) `name` - The name of the resource share. The name of the RAM resource share is generated with the name of the Route53 profile as a prefix.
    (Optional) `permissions` - A set of the names of the RAM permissions to associate with the resource share. Defaults to `["AWSRAMPermissionRoute53ProfileAllowAssociation"]`.
    (Optional) `external_principals_allowed` - Whether principals outside your organization can be associated with the resource share. Defaults to `false`.
    (Optional) `principals` - A set of principals to associate with the resource share. Possible values are an AWS account ID, an ARN of an organization in AWS Organizations, an ARN of an organizational unit (OU) in AWS Organizations, or an ARN of an IAM role or user. Defaults to `[]`.
    (Optional) `tags` - A map of tags to add to the resource share. Defaults to `{}`.
  EOF
  type = list(object({
    name = string

    permissions = optional(set(string), ["AWSRAMPermissionRoute53ProfileAllowAssociation"])

    external_principals_allowed = optional(bool, false)
    principals                  = optional(set(string), [])

    tags = optional(map(string), {})
  }))
  default  = []
  nullable = false
}
