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

data "aws_vpc" "default" { default = true }

resource "aws_route53_zone" "private" {
  name          = var.name
  comment       = var.comment
  force_destroy = var.force_destroy

  vpc {
    vpc_region = try(var.primary_vpc_association.region, null)
    vpc_id     = try(var.primary_vpc_association.vpc_id, data.aws_vpc.default.id)
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
    for vpc_association in var.authorized_cross_account_vpc_associations :
    vpc_association.vpc_id => vpc_association
  }

  zone_id = aws_route53_zone.private.zone_id

  vpc_region = try(each.value.region, null)
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

  vpc_region = try(each.value.region, null)
  vpc_id     = each.value.vpc_id

  depends_on = [
    aws_route53_vpc_association_authorization.this
  ]
}
