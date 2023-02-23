output "id" {
  description = "The ID of the Route 53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.id
}

output "arn" {
  description = "The ARN of the Route 53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.arn
}

output "name" {
  description = "The name of the Route 53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.name
}

output "vpc_id" {
  description = "The ID of the VPC that you want to create the resolver endpoint in."
  value       = aws_route53_resolver_endpoint.this.host_vpc_id
}

output "ip_addresses" {
  description = "IP addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs."
  value       = aws_route53_resolver_endpoint.this.ip_address[*].ip
}

output "security_group_ids" {
  description = "A list of the ID of security groups that you want to use to control access to this VPC."
  value       = aws_route53_resolver_endpoint.this.security_group_ids
}

output "subnet_ids" {
  description = "A list of the ID of subnets that IP addresses of resolver endpoint are allocated in."
  value       = distinct(aws_route53_resolver_endpoint.this.ip_address[*].subnet_id)
}
