variable "zone" {
  description = "(Required) The ID of the hosted zone to contain this record set."
  type        = string
  nullable    = false
}

variable "name" {
  description = "(Required) The name of the record. Enter a fully qualified domain name, for example, `www.example.com`. You can use the asterisk (*) wildcard to replace the leftmost label in a domain name, for example, `*.example.com`."
  type        = string
  nullable    = false
}

variable "type" {
  description = "(Required) The DNS record type. Valid values are `A`, `AAAA`, `CAA`, `CNAME`, `DS`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV` and `TXT`."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["A", "AAAA", "CAA", "CNAME", "DS", "MX", "NAPTR", "NS", "PTR", "SOA", "SPF", "SRV", "TXT"], var.type)
    error_message = "Valid values of `type` are `A`, `AAAA`, `CAA`, `CNAME`, `DS`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV` and `TXT`."
  }
}

variable "ttl" {
  description = <<EOF
  (Optional) The record cache time to live (TTL) in seconds. Defaults to `300`.
    - If you're creating or updating an alias record set, omit `ttl`. Route 53 uses the value of TTL for the alias target.
    - If you're associating this record set with a health check, we recommend that you specify a `ttl` of `60` seconds or less so clients respond quickly to changes in health status.
    - All of the records in a group of weighted record sets must have the same value for `ttl`.
    - If a group of weighted record sets includes one or more weighted alias records for which the alias target is an ELB load balancer, we recommend that you specify a `ttl` of `60` seconds for all of the non-alias weighted records that have the same name and type. Values other than `60` seconds (the TTL for load balancers) will change the effect of the values that you specify for weight.
  EOF
  type        = number
  default     = 300
  nullable    = false

  validation {
    condition = alltrue([
      var.ttl > 0,
      var.ttl <= 2147483647
    ])
    error_message = "`ttl` must be greater than 0 and less than or equal to 2147483647."
  }
}

variable "overwrite" {
  description = "(Optional) Whether to allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. This configuration is not recommended for most environments. Defaults to `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "routing_policy" {
  description = <<EOF
  (Optional) The routing policy determines how Route 53 responds to queries. Defaults to `SIMPLE`. Supported routing policies are following:
    `SIMPLE`
    `WEIGHTED`
    `GEOLOCATION`
    `LATENCY`
    `FAILOVER`
    `MULTIVALUE_ANSWER`
    `CIDR`
    `GEOPROXIMITY`
  EOF
  type        = string
  default     = "SIMPLE"
  nullable    = false

  validation {
    condition     = contains(["SIMPLE", "WEIGHTED", "GEOLOCATION", "LATENCY", "FAILOVER", "MULTIVALUE_ANSWER", "CIDR", "GEOPROXIMITY"], var.routing_policy)
    error_message = "Valid values of `routing_policy` are `SIMPLE`, `WEIGHTED`, `GEOLOCATION`, `LATENCY`, `FAILOVER`, `MULTIVALUE_ANSWER`, `CIDR`, `GEOPROXIMITY`."
  }
}

variable "records" {
  description = <<EOF
  (Optional) A list of records for the record set. Each item of `records` as defined below.
    (Optional) `id` - A unique ID to differentiate this record from other records with the same domain name and type. Not required if the `routing_policy` is `SIMPLE`. Defaults to `default`.
    (Optional) `value` - A configuration for non-alias record with a list of the record values. You can specify more than one value for all record types except `CNAME` and `SOA`. Conflicts with `alias`.
    (Optional) `alias` - A configuration for alias record. Conflicts with `value`. `alias` as defined below.
      (Required) `name` - DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another record set in this hosted zone.
      (Required) `zone` - Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.
      (Optional) `evaluate_target_health` - Whether to respond to DNS queries using this record by checking the health of the alias target. Some resources have special requirements, see related part of documentation. Defaults to `true`.
  EOF
  type = list(object({
    id    = optional(string, "default")
    value = optional(list(string))
    alias = optional(object({
      name                   = string
      zone                   = string
      evaluate_target_health = optional(bool, true)
    }))
  }))
  default  = []
  nullable = false

  validation {
    condition     = length(var.records) > 0
    error_message = "At least one record must be provided."
  }
  validation {
    condition     = length(distinct(var.records[*].id)) == length(var.records)
    error_message = "Each record `id` must be unique in the record set."
  }
  validation {
    condition = alltrue([
      for record in var.records :
      anytrue([
        record.value != null && record.alias == null,
        record.value == null && record.alias != null,
      ])
    ])
    error_message = "Each record must have either `value` or `alias`."
  }
}
