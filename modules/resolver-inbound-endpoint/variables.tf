variable "name" {
  description = "(Required) The name of the Route53 Resolver Inbound Endpoint."
  type        = string
}

variable "security_groups" {
  description = "(Optional) A list of security groups for Route53 Resolver Inbound Endpoint."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "ip_allocations" {
  description = "(Required) A list of IP allocations which include `subnet_id` and `ip`. `ip` is a private IP from `subnet`."
  type = list(object({
    subnet_id = string
    ip        = string
  }))

  validation {
    condition     = length(var.ip_allocations) >= 2
    error_message = "To improve reliability, Resolver requires that you specify two IP addresses for DNS queries. We recommend that you specify IP addresses in two different Availability Zones. After you add the first two IP addresses, you can optionally add more in the same or different Availability Zones."
  }
}

variable "allowed_ingress_cidrs" {
  description = "(Optional) A list of CIDR for Route53 Resolver Inbound Endpoint ingress access."
  type        = list(string)
  default     = ["0.0.0.0/0"]
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
