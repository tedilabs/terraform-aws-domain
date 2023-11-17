# INFO: [2023-11-17] Change the name of `aws_acm_certificate_validation` resource for DNS validation
moved {
  from = aws_acm_certificate_validation.this
  to   = aws_acm_certificate_validation.dns
}
