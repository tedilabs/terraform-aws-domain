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

output "effective_date" {
  description = "Effective date and time of the certificate. Start of the validity period of the certificate."
  value       = aws_acm_certificate.this.not_before
}

output "expiration_date" {
  description = "Expiration date and time of the certificate."
  value       = aws_acm_certificate.this.not_after
}