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
# - `certificate_authority_arn`
# - `certificate_body`
# - `certificate_chain`
# - `private_key`
# TODO: Support `EMAIL` validation method
# - `validation_options`
resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names

  key_algorithm = local.key_algorithms[var.key_algorithm]

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_enabled ? "ENABLED" : "DISABLED"
  }

  validation_method = var.validation_method

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


###################################################
# DNS Validation
###################################################

locals {
  subject_names = concat([var.domain_name], var.subject_alternative_names)

  dns_validation_enabled = var.validation_method == "DNS" && var.dns_validation.enabled
  dns_validation_records = {
    for record in aws_acm_certificate.this.domain_validation_options :
    record.domain_name => {
      name  = record.resource_record_name
      type  = record.resource_record_type
      value = record.resource_record_value
    }
  }
}

resource "aws_route53_record" "validation" {
  for_each = toset(local.dns_validation_enabled ? local.subject_names : [])

  zone_id = var.dns_validation.managed_zones[replace(each.value, "*.", "")]
  name    = local.dns_validation_records[each.value].name
  type    = local.dns_validation_records[each.value].type
  records = [local.dns_validation_records[each.value].value]

  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "dns" {
  count = local.dns_validation_enabled ? 1 : 0

  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = values(aws_route53_record.validation)[*].fqdn
}


###################################################
# Email Validation
###################################################

locals {
  email_validation_enabled = var.validation_method == "EMAIL" && var.email_validation.enabled
}

resource "aws_acm_certificate_validation" "email" {
  count = local.email_validation_enabled ? 1 : 0

  certificate_arn = aws_acm_certificate.this.arn
}
