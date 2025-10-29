locals {
  security_groups = concat(
    (var.default_security_group.enabled
      ? module.security_group[*].id
      : []
    ),
    var.security_groups,
  )
}

data "aws_subnet" "this" {
  for_each = toset(var.ip_allocations[*].subnet)

  region = var.region

  id = each.value
}


###################################################
# Security Group
###################################################

module "security_group" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "~> 1.0.0"

  count = var.default_security_group.enabled ? 1 : 0

  region = var.region

  name        = coalesce(var.default_security_group.name, local.metadata.name)
  description = var.default_security_group.description
  vpc_id      = values(data.aws_subnet.this)[0].vpc_id

  ingress_rules = concat(
    var.default_security_group.ingress_rules,
    [
      for protocol in ["tcp", "udp"] : {
        id          = "dns-${protocol}"
        description = "Allow to query to Route53 Resolver Inbound Endpoint."
        protocol    = protocol
        from_port   = 53
        to_port     = 53

        ipv4_cidrs      = var.default_security_group.ingress_ipv4_cidrs
        ipv6_cidrs      = var.default_security_group.ingress_ipv6_cidrs
        prefix_lists    = var.default_security_group.ingress_prefix_lists
        security_groups = var.default_security_group.ingress_security_groups
      }
      if anytrue([
        length(var.default_security_group.ingress_ipv4_cidrs) > 0,
        length(var.default_security_group.ingress_ipv6_cidrs) > 0,
        length(var.default_security_group.ingress_prefix_lists) > 0,
        length(var.default_security_group.ingress_security_groups) > 0,
      ])
    ]
  )
  egress_rules = concat(
    var.default_security_group.egress_rules,
  )

  revoke_rules_on_delete = true
  resource_group = {
    enabled = false
  }
  module_tags_enabled = false

  tags = merge(
    local.module_tags,
    var.tags,
  )
}
