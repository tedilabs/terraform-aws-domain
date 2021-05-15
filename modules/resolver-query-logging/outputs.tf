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

output "share_status" {
  description = "An indication of whether the query logging configuration is shared with other AWS accounts, or was shared with the current account by another AWS account. Sharing is configured through AWS Resource Access Manager (AWS RAM). Values are `NOT_SHARED`, `SHARED_BY_ME` or `SHARED_WITH_ME`."
  value       = aws_route53_resolver_query_log_config.this.share_status
}

output "vpc_ids" {
  description = "A list of associated VPC IDs to query logging configuration."
  value       = var.vpc_ids
}

output "destination_arn" {
  description = "The ARN of the resource that Route 53 Resolver send query logs. This can be S3 bucket, CloudWatch Logs log group, or Kinesis Data Firehose delivery stream."
  value       = var.destination_arn
}
