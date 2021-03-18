output "name" {
  description = "The name of the certificate."
  value       = var.name
}

output "arn" {
  description = "The ARN of the certificate."
  value       = var.validation_dns_managed ? aws_acm_certificate_validation.this[0].certificate_arn : aws_acm_certificate.this.arn
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

output "certificate_transparency_logging_enabled" {
  description = "Whether or not the certificate transparency logging is enabled."
  value       = var.certificate_transparency_logging_enabled
}

output "validation_method" {
  description = "The method to use for validation."
  value       = aws_acm_certificate.this.validation_method
}

output "validation_domain_records" {
  description = "List of domain validation objects which can be used to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if `DNS` validation was used."
  value       = aws_acm_certificate.this.domain_validation_options
}

output "validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if `EMAIL` validation was used."
  value       = aws_acm_certificate.this.validation_emails
}


###################################################
# Resource Group
###################################################

output "resource_group_enabled" {
  description = "Whether Resource Group is enabled."
  value       = var.resource_group_enabled
}

output "resource_group_name" {
  description = "The name of Resource Group."
  value       = try(aws_resourcegroups_group.this.*.name[0], null)
}
