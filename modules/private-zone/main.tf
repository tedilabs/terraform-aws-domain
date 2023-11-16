locals {
  metadata = {
    package = "terraform-aws-domain"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = "${var.namespace}/${var.name}"
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
# Private Hosted Zone
###################################################

# INFO: Not supported attributes
# - `delegation_set_id`
resource "aws_route53_zone" "private" {
  name          = var.name
  comment       = var.description
  force_destroy = var.force_destroy

  vpc {
    vpc_region = var.primary_vpc_association.region
    vpc_id     = var.primary_vpc_association.vpc_id
  }

  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )

  lifecycle {
    ignore_changes = [vpc]
  }
}


###################################################
# Authorizations for VPC Associations
###################################################

resource "aws_route53_vpc_association_authorization" "this" {
  for_each = {
    for authorization in var.cross_account_vpc_association_authorizations :
    authorization.vpc_id => authorization
  }

  zone_id = aws_route53_zone.private.zone_id

  vpc_region = each.value.region
  vpc_id     = each.value.vpc_id
}


###################################################
# VPC Associations
###################################################

resource "aws_route53_zone_association" "secondary" {
  for_each = {
    for vpc_association in var.secondary_vpc_associations :
    vpc_association.vpc_id => vpc_association
  }

  zone_id = aws_route53_zone.private.zone_id

  vpc_region = each.value.region
  vpc_id     = each.value.vpc_id

  depends_on = [
    aws_route53_vpc_association_authorization.this
  ]
}
