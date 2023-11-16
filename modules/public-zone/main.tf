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
# Public Hosted Zone
###################################################

# INFO: Not supported attributes
# - `vpc`
resource "aws_route53_zone" "public" {
  name          = var.name
  comment       = var.description
  force_destroy = var.force_destroy

  delegation_set_id = var.delegation_set

  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )
}


###################################################
# Query Logging for Public Hosted Zone
###################################################

resource "aws_route53_query_log" "this" {
  count = var.logging.cloudwatch.enabled ? 1 : 0

  zone_id = aws_route53_zone.public.zone_id

  cloudwatch_log_group_arn = var.logging.cloudwatch.log_group
}
