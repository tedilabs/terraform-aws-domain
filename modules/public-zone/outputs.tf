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

output "comment" {
  description = "A comment for the Hosted Zone."
  value       = aws_route53_zone.public.comment
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set."
  value       = aws_route53_zone.public.name_servers
}

output "delegation_set_id" {
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
