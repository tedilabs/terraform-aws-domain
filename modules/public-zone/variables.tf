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

variable "delegation_set" {
  description = "(Optional) The ID of the reusable delegation set whose NS records you want to assign to the Hosted Zone."
  type        = string
  default     = null
}

variable "logging" {
  description = <<EOF
  (Optional) The configuration of Route53 query logging. `logging` as defined below.
    (Optional) `cloudwatch` - A configuration to define where the execution history events are logged. `cloudwatch` as defined below.
      (Optional) `enabled` - Whether to enable or disable Route53 query logging.
      (Optional) `log_group` - The ARN (Amazon Resource Name) of the CloudWatch Log Group. The CloudWatch log group must be in the `us-east-1` region. A permissive CloudWatch log resource policy must be in place.
  EOF
  type = object({
    cloudwatch = optional(object({
      enabled   = optional(bool, false)
      log_group = optional(string, "")
    }), {})
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
