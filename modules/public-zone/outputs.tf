output "arn" {
  description = "The Amazon Resource Name (ARN) of the Hosted Zone."
  value       = aws_route53_zone.public.arn
}

output "id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = aws_route53_zone.public.id
}

output "name" {
  description = "The name of the Hosted Zone."
  value       = aws_route53_zone.public.name
}

output "namespace" {
  description = "The namespace of the Hosted Zone."
  value       = var.namespace
}

output "description" {
  description = "A description for the Hosted Zone."
  value       = aws_route53_zone.public.comment
}

output "primary_name_server" {
  description = "The Route 53 name server that created the SOA record."
  value       = aws_route53_zone.public.primary_name_server
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set."
  value       = aws_route53_zone.public.name_servers
}

output "delegation_set" {
  description = "The ID of the assigned delegation set."
  value       = aws_route53_zone.public.delegation_set_id
}

output "logging" {
  description = <<EOF
  A configuration for query logging of the Route53 Hosted Zone.
    `cloudwatch` - The configuration for Route53 query logs to CloudWatch Logs.
  EOF
  value = {
    cloudwatch = {
      enabled   = length(aws_route53_query_log.this) > 0
      log_group = one(aws_route53_query_log.this[*].cloudwatch_log_group_arn)
    }
  }
}

output "ns_records" {
  description = <<EOF
  A map of `NS` records for the zone. Each key of the map is the record name.
    `values` - A list of the record values
    `ttl` - The TTL of the record.
  EOF
  value = {
    for name, record in aws_route53_record.ns :
    name => {
      values = record.records
      ttl    = record.ttl
    }
  }
}
