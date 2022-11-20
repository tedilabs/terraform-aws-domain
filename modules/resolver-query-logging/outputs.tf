output "id" {
  description = "The ID of the Route 53 Resolver query logging configuration."
  value       = aws_route53_resolver_query_log_config.this.id
}

output "arn" {
  description = "The ARN of the Route 53 Resolver query logging configuration."
  value       = aws_route53_resolver_query_log_config.this.arn
}

output "owner_id" {
  description = "The AWS Account ID the account that created the query logging configuration."
  value       = aws_route53_resolver_query_log_config.this.owner_id
}

output "name" {
  description = "The name of the Route 53 Resolver query logging configuration."
  value       = aws_route53_resolver_query_log_config.this.name
}

output "vpc_associations" {
  description = "A list of associated VPC IDs to query logging configuration."
  value       = keys(aws_route53_resolver_query_log_config_association.this)
}

output "destination" {
  description = "The ARN of the resource that Route 53 Resolver send query logs. This can be S3 bucket, CloudWatch Logs log group, or Kinesis Data Firehose delivery stream."
  value       = aws_route53_resolver_query_log_config.this.destination_arn
}

output "sharing" {
  description = <<EOF
  The configuration for sharing of the Route53 Resolver query logging configuration.
    `status` - An indication of whether the query logging configuration is shared with other AWS accounts, or was shared with the current account by another AWS account. Sharing is configured through AWS Resource Access Manager (AWS RAM). Values are `NOT_SHARED`, `SHARED_BY_ME` or `SHARED_WITH_ME`.
    `shares` - The list of resource shares via RAM (Resource Access Manager).
  EOF
  value = {
    status = aws_route53_resolver_query_log_config.this.share_status
    shares = module.share
  }
}
