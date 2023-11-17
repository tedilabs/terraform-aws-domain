locals {
  metadata = {
    package = "terraform-aws-domain"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = var.name
  }
  module_tags = {
    "module.terraform.io/package"   = local.metadata.package
    "module.terraform.io/version"   = local.metadata.version
    "module.terraform.io/name"      = local.metadata.module
    "module.terraform.io/full-name" = "${local.metadata.package}/${local.metadata.module}"
    "module.terraform.io/instance"  = local.metadata.name
  }
}


###################################################
# CIDR Collection
###################################################

resource "aws_route53_cidr_collection" "this" {
  name = var.name
}


###################################################
# Locations for CIDR Collection
###################################################

resource "aws_route53_cidr_location" "this" {
  for_each = var.locations

  cidr_collection_id = aws_route53_cidr_collection.this.id

  name        = each.key
  cidr_blocks = each.value
}
