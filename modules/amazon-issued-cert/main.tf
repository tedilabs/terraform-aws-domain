resource "aws_acm_certificate" "this" {
  domain_name               = var.subject_name
  subject_alternative_names = var.subject_alternative_names

  validation_method = var.validation_method

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_enabled ? "ENABLED" : "DISABLED"
  }

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
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
  subject_names = concat([var.subject_name], var.subject_alternative_names)

  validation_dns_managed = var.validation_method == "DNS" && var.validation_dns_managed
  validation_domain_records = {
    for record in aws_acm_certificate.this.domain_validation_options :
    record.domain_name => record
  }
}

resource "aws_route53_record" "validation" {
  for_each = toset(local.validation_dns_managed ? local.subject_names : [])

  zone_id = var.validation_dns_managed_zones[replace(each.value, "*.", "")]
  type    = local.validation_domain_records[each.value].resource_record_type
  name    = local.validation_domain_records[each.value].resource_record_name
  records = [local.validation_domain_records[each.value].resource_record_value]

  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "this" {
  count = local.validation_dns_managed ? 1 : 0

  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = values(aws_route53_record.validation)[*].fqdn
}
