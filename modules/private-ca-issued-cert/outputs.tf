output "name" {
  description = "The name of the certificate."
  value       = var.name
}

output "arn" {
  description = "The ARN of the certificate."
  value       = aws_acm_certificate.this.arn
}

output "status" {
  description = "Status of the certificate."
  value       = aws_acm_certificate.this.status
}

output "subject_name" {
  description = "The domain name for which the certificate is issued."
  value       = aws_acm_certificate.this.domain_name
}

output "subject_alternative_names" {
  description = "List of domains that is SANs in the issued certificate."
  value       = aws_acm_certificate.this.subject_alternative_names
}

output "certificate_authority_arn" {
  description = "The ARN of an ACMPCA."
  value       = aws_acm_certificate.this.certificate_authority_arn
}
