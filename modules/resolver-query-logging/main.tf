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
# Log Config for Resolver Query
###################################################

resource "aws_route53_resolver_query_log_config" "this" {
  region = var.region

  name            = local.metadata.name
  destination_arn = var.destination

  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )
}

resource "aws_route53_resolver_query_log_config_association" "this" {
  for_each = toset(var.vpc_associations)

  region = var.region

  resolver_query_log_config_id = aws_route53_resolver_query_log_config.this.id
  resource_id                  = each.value
}
