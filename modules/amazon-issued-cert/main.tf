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
