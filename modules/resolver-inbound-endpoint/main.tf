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

resource "aws_route53_resolver_endpoint" "this" {
  name      = local.metadata.name
  direction = "INBOUND"

  security_group_ids = concat(var.security_groups, [
    module.security_group__this.id,
  ])

  dynamic "ip_address" {
    for_each = var.ip_allocations

    content {
      subnet_id = ip_address.value.subnet_id
      ip        = ip_address.value.ip
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


###################################################
# Security Group
###################################################

data "aws_subnet" "this" {
  id = var.ip_allocations[0].subnet_id
}

module "security_group__this" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "~> 0.32.1"

  name        = local.metadata.name
  description = "Security Group for Route53 Resolver Inbound Endpoint."
  vpc_id      = data.aws_subnet.this.vpc_id

  ingress_rules = [
    {
      id          = "dns-tcp/cidrs"
      description = "Allow CIDRs to query to Route53 Resolver Inbound Endpoint."
      protocol    = "tcp"
      from_port   = 53
      to_port     = 53

      cidr_blocks = var.allowed_ingress_cidrs
    },
    {
      id          = "dns-udp/cidrs"
      description = "Allow CIDRs to query to Route53 Resolver Inbound Endpoint."
      protocol    = "udp"
      from_port   = 53
      to_port     = 53

      cidr_blocks = var.allowed_ingress_cidrs
    },
  ]
  egress_rules = []

  resource_group_enabled = false
  module_tags_enabled    = false

  tags = merge(
    local.module_tags,
    var.tags,
  )
}
