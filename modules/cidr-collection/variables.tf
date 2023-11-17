variable "name" {
  description = "(Required) The name for the CIDR collection."
  type        = string
  nullable    = false
}

variable "locations" {
  description = <<EOF
  (Optional) A configurations for locations of the CIDR collection. Each key is the CIDR location name. Each value is a set of the location CIDR blocks.
  EOF
  type        = map(set(string))
  default     = {}
  nullable    = false
}
