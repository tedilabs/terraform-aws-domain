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

locals {
  key_algorithms = {
    "RSA_1024"   = "RSA_1024"
    "RSA_2048"   = "RSA_2048"
    "RSA_3072"   = "RSA_3072"
    "RSA_4096"   = "RSA_4096"
    "ECDSA_P256" = "EC_prime256v1"
    "ECDSA_P384" = "EC_secp384r1"
    "ECDSA_P521" = "EC_secp521r1"
  }
}


###################################################
# ACM Certificate
###################################################

# INFO: Not supported attributes
# - `certificate_body`
# - `certificate_chain`
# - `private_key`
# - `validation_method`
# - `validation_options`
resource "aws_acm_certificate" "this" {
  certificate_authority_arn = var.certificate_authority

  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  key_algorithm = local.key_algorithms[var.key_algorithm]

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
