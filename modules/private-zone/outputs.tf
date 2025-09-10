output "arn" {
  description = "The Amazon Resource Name (ARN) of the Hosted Zone."
  value       = aws_route53_zone.private.arn
}

output "id" {
  description = "The Hosted Zone ID. This can be referenced by zone records."
  value       = aws_route53_zone.private.id
}

output "name" {
  description = "The name of the Hosted Zone."
  value       = aws_route53_zone.private.name
}

output "namespace" {
  description = "The namespace of the Hosted Zone."
  value       = var.namespace
}

output "description" {
  description = "A description for the Hosted Zone."
  value       = aws_route53_zone.private.comment
}

output "primary_name_server" {
  description = "The Route 53 name server that created the SOA record."
  value       = aws_route53_zone.private.primary_name_server
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set."
  value       = aws_route53_zone.private.name_servers
}

output "vpc_associations" {
  description = "A list of associated VPCs with a private Hosted Zone."
  value = [
    for association in aws_route53_zone.private.vpc : {
      region = association.vpc_region
      vpc_id = association.vpc_id
    }
  ]
}

output "cross_account_vpc_association_authorizations" {
  description = "A list of authorized VPCs in cross accounts to associate with a private Hosted Zone."
  value = [
    for authorization in values(aws_route53_vpc_association_authorization.this) : {
      region = authorization.vpc_region
      vpc_id = authorization.vpc_id
    }
  ]
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
