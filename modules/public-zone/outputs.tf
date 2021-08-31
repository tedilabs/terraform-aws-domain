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
