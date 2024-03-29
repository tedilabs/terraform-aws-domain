output "name" {
  description = "The name of the certificate."
  value       = var.name
}

output "id" {
  description = "The ID of the certificate."
  value       = aws_acm_certificate.this.id
}

output "arn" {
  description = "The ARN of the certificate."
  value       = aws_acm_certificate.this.arn
}

output "status" {
  description = "Status of the certificate."
  value       = aws_acm_certificate.this.status
}

output "type" {
  description = "The type of the certificate."
  value       = aws_acm_certificate.this.type
}

output "domain_name" {
  description = "The domain name for which the certificate is issued."
  value       = aws_acm_certificate.this.domain_name
}

output "subject_alternative_names" {
  description = "The list of additional FQDNs (Fully qualified domain names) to be included in SANs of the issued certificate."
  value       = aws_acm_certificate.this.subject_alternative_names
}

output "key_algorithm" {
  description = "The algorithm of the public and private key pair to encrypt data."
  value = {
    for k, v in local.key_algorithms :
    v => k
  }[aws_acm_certificate.this.key_algorithm]
}

output "certificate_authority" {
  description = "The ARN (Amazon Resource Name) of the AWS PCA (Private Certificate Authority)."
  value       = aws_acm_certificate.this.certificate_authority_arn
}

output "effective_date" {
  description = "Effective date and time of the certificate. Start of the validity period of the certificate."
  value       = aws_acm_certificate.this.not_before
}

output "expiration_date" {
  description = "Expiration date and time of the certificate."
  value       = aws_acm_certificate.this.not_after
}
