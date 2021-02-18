resource "aws_acm_certificate" "this" {
  domain_name               = var.subject_name
  subject_alternative_names = var.subject_alternative_names

  certificate_authority_arn = var.certificate_authority_arn

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
