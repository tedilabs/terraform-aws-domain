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
# ACM Certificate
###################################################

# INFO: Not supported attributes
# - `certificate_body`
# - `certificate_chain`
# - `key_algorithm`
# - `options`
# - `private_key`
# - `validation_method`
# - `validation_options`
resource "aws_acm_certificate" "this" {
  region = var.region

  certificate_authority_arn = var.certificate_authority

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  early_renewal_duration = var.early_renewal_duration

  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}
