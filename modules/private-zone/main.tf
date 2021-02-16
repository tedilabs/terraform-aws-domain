data "aws_region" "this" {}
data "aws_vpc" "default" { default = true }

resource "aws_route53_zone" "private" {
  name          = var.name
  comment       = var.comment
  force_destroy = var.force_destroy

  vpc {
    vpc_region = data.aws_region.this.name
    vpc_id     = data.aws_vpc.default.id
  }

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )

  lifecycle {
    ignore_changes = [vpc]
  }
}


###################################################
# VPC Associations
###################################################

resource "aws_route53_vpc_association_authorization" "this" {
  for_each = {
    for vpc_association in var.authorized_cross_account_vpc_associations:
      vpc_association.vpc_id => vpc_association
  }

  zone_id = aws_route53_zone.private.zone_id

  vpc_region = lookup(each.value, "vpc_region", data.aws_region.this.name)
  vpc_id     = each.value.vpc_id
}
