output "arn" {
  description = "The Amazon Resource Name (ARN) of the CIDR collection."
  value       = aws_route53_cidr_collection.this.arn
}

output "id" {
  description = "The CIDR collection ID."
  value       = aws_route53_cidr_collection.this.id
}

output "name" {
  description = "The name of the CIDR collection."
  value       = aws_route53_cidr_collection.this.name
}

output "version" {
  description = "The version of the CIDR collection."
  value       = aws_route53_cidr_collection.this.version
}

output "locations" {
  description = "A map of locations for the CIDR collection."
  value = {
    for name, location in aws_route53_cidr_location.this :
    name => location.cidr_blocks
  }
}
