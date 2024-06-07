output "zone" {
  description = "The information for Hosted Zone of the record set."
  value = {
    arn  = data.aws_route53_zone.this.arn
    id   = values(aws_route53_record.this)[0].zone_id
    name = data.aws_route53_zone.this.name
  }
}

output "name" {
  description = "The name of the record."
  value       = values(aws_route53_record.this)[0].name
}

output "fqdn" {
  description = "The FQDN (Fully-qualified Domain Name) of the record."
  value       = values(aws_route53_record.this)[0].fqdn
}

output "type" {
  description = "The DNS record type of the record set."
  value       = values(aws_route53_record.this)[0].type
}

output "ttl" {
  description = "The record cache time to live (TTL) in seconds."
  value       = values(aws_route53_record.this)[0].ttl
}

output "routing_policy" {
  description = "The routing policy of the record set."
  value       = var.routing_policy
}

output "records" {
  description = <<EOF
  A list of records for the record set. Each item of `records` as defined below.
    `id` - A unique ID to differentiate this record from other records with the same domain name and type.
    `value` - A configuration for non-alias record with a list of the record values.
    `alias` - A configuration for alias record. Conflicts with `value`. `alias` as defined below.
      `name` - DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another record set in this hosted zone.
      `zone` - Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.
      `evaluate_target_health` - Whether to respond to DNS queries using this record by checking the health of the alias target.
  EOF
  value = {
    for id, record in aws_route53_record.this :
    id => {
      id    = record.set_identifier
      value = record.records
      alias = (one(record.alias) != null
        ? {
          name                   = record.alias[0].name
          zone                   = record.alias[0].zone_id
          evaluate_target_health = record.alias[0].evaluate_target_health
        }
        : null
      )
    }
  }
}

# output "debug" {
#   value = {
#     for k, v in values(aws_route53_record.this)[0] :
#     k => v
#     if !contains(["zone_id", "type", "ttl", "name", "fqdn", "id", "allow_overwrite", "alias", "set_identifier", "records"], k)
#   }
# }
