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

output "comment" {
  description = "A comment for the Hosted Zone."
  value       = aws_route53_zone.private.comment
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set."
  value       = aws_route53_zone.private.name_servers
}

output "vpc_associations" {
  description = "A list of associated VPCs with a private Hosted Zone."
  value       = aws_route53_zone.private.vpc
}

output "authorized_cross_account_vpc_associations" {
  description = "A list of authorized VPCs in cross accounts to associate with a private Hosted Zone."
  value = [
    for authorization in values(aws_route53_vpc_association_authorization.this) : {
      vpc_region = authorization.vpc_region
      vpc_id     = authorization.vpc_id
    }
  ]
}
