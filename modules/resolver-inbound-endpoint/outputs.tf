output "id" {
  description = "The ID of the Route53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.id
}

output "arn" {
  description = "The ARN of the Route53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.arn
}

output "name" {
  description = "The name of the Route53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.name
}

output "direction" {
  description = "The direction of DNS queries to or from the Route 53 Resolver endpoint."
  value       = aws_route53_resolver_endpoint.this.direction
}

output "protocols" {
  description = "A set of protocols to use for the Route53 Resolver Inbound Endpoint."
  value       = aws_route53_resolver_endpoint.this.protocols
}

output "vpc_id" {
  description = "The ID of the VPC that you want to create the resolver endpoint in."
  value       = aws_route53_resolver_endpoint.this.host_vpc_id
}

output "ip_address_type" {
  description = "The type of IP addresses used by the Route53 Resolver Inbound Endpoint."
  value       = aws_route53_resolver_endpoint.this.resolver_endpoint_type
}

output "ip_allocations" {
  description = "The configuration for IP allocations of the Route53 Resolver Inbound Endpoint."
  value = {
    for ip_allocation in aws_route53_resolver_endpoint.this.ip_address :
    data.aws_subnet.this[ip_allocation.subnet_id].availability_zone_id => {
      az_id        = data.aws_subnet.this[ip_allocation.subnet_id].availability_zone_id
      subnet       = ip_allocation.subnet_id
      id           = ip_allocation.ip_id
      ipv4_address = ip_allocation.ip
      ipv6_address = ip_allocation.ipv6
    }
  }
}

output "ipv4_addresses" {
  description = "A set of IPv4 addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs."
  value       = toset(aws_route53_resolver_endpoint.this.ip_address[*].ip)
}

output "ipv6_addresses" {
  description = "A set of IPv6 addresses in your VPC that you want DNS queries to pass through on the way from your network to your VPCs."
  value       = toset(aws_route53_resolver_endpoint.this.ip_address[*].ipv6)
}

output "default_security_group" {
  description = "The default security group ID of the Route53 Resolver Endpoint."
  value       = one(module.security_group[*].id)
}

output "security_groups" {
  description = "A set of security group IDs which is assigned to the Route53 Resolver Endpoint."
  value       = aws_route53_resolver_endpoint.this.security_group_ids
}

output "subnets" {
  description = "A set of the ID of subnets that IP addresses of resolver endpoint are allocated in."
  value       = toset(aws_route53_resolver_endpoint.this.ip_address[*].subnet_id)
}

# output "debug" {
#   value = {
#     for k, v in aws_route53_resolver_endpoint.this :
#     k => v
#     if !contains(["id", "arn", "direction", "name", "host_vpc_id", "security_group_ids", "protocols", "resolver_endpoint_type", "tags", "tags_all", "ip_address", "timeouts"], k)
#   }
# }

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
