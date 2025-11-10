output "region" {
  description = "The AWS region this module resources resides in."
  value       = aws_route53profiles_profile.this.region
}

output "owner_id" {
  description = "The AWS Account ID the account that created the Route53 Profile."
  value       = aws_route53profiles_profile.this.owner_id
}

output "arn" {
  description = "The ARN of the Route53 Profile."
  value       = aws_route53profiles_profile.this.arn
}

output "id" {
  description = "The ID of the Route53 Profile."
  value       = aws_route53profiles_profile.this.id
}

output "name" {
  description = "The name of the Route53 Profile."
  value       = aws_route53profiles_profile.this.name
}

output "status" {
  description = "The status of the Route53 Profile."
  value       = aws_route53profiles_profile.this.status
}

output "status_message" {
  description = "The status message of the Route53 Profile."
  value       = aws_route53profiles_profile.this.status_message
}

output "resource_group" {
  description = "The resource group created to manage resources in this module."
  value = merge(
    {
      enabled = var.resource_group.enabled && var.module_tags_enabled
    },
    (var.resource_group.enabled && var.module_tags_enabled
      ? {
        arn  = module.resource_group[0].arn
        name = module.resource_group[0].name
      }
      : {}
    )
  )
}

output "sharing" {
  description = <<EOF
  The configuration for sharing of the Route53 profile.
    `status` - An indication of whether the profile is shared with other AWS accounts, or was shared with the current account by another AWS account. Sharing is configured through AWS Resource Access Manager (AWS RAM). Values are `NOT_SHARED`, `SHARED_BY_ME` or `SHARED_WITH_ME`.
    `shares` - The list of resource shares via RAM (Resource Access Manager).
  EOF
  value = {
    status = aws_route53profiles_profile.this.share_status
    shares = module.share
  }
}

# output "debug" {
#   value = {
#     for k, v in aws_route53profiles_profile.this :
#     k => v
#     if !contains(["arn", "id", "name", "status", "status_message", "share_status", "tags", "tags_all", "region", "timeouts", "owner_id"], k)
#   }
# }
