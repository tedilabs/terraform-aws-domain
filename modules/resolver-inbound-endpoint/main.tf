locals {
  metadata = {
    package = "terraform-aws-domain"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = var.name
  }
  module_tags = var.module_tags_enabled ? {
    "module.terraform.io/package"   = local.metadata.package
    "module.terraform.io/version"   = local.metadata.version
    "module.terraform.io/name"      = local.metadata.module
    "module.terraform.io/full-name" = "${local.metadata.package}/${local.metadata.module}"
    "module.terraform.io/instance"  = local.metadata.name
  } : {}
}


###################################################
# Inbound Endpoint for Route53 Resolver
###################################################

resource "aws_route53_resolver_endpoint" "this" {
  region = var.region

  direction = var.delegation_enabled ? "INBOUND_DELEGATION" : "INBOUND"
  name      = local.metadata.name

  protocols          = var.protocols
  security_group_ids = local.security_groups

  resolver_endpoint_type = var.ip_address_type
  dynamic "ip_address" {
    for_each = var.ip_allocations

    content {
      subnet_id = ip_address.value.subnet
      ip        = ip_address.value.ipv4_address
      ipv6      = ip_address.value.ipv6_address
    }
  }

  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )
}
