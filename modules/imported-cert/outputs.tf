output "region" {
  description = "The AWS region this module resources resides in."
  value       = aws_acm_certificate.this.region
}

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

output "effective_date" {
  description = "Effective date and time of the certificate. Start of the validity period of the certificate."
  value       = aws_acm_certificate.this.not_before
}

output "expiration_date" {
  description = "Expiration date and time of the certificate."
  value       = aws_acm_certificate.this.not_after
}

output "resource_group" {
  description = "The resource group created to manage resources in this module."
  value = merge(
    {
      enabled = var.resource_group.enabled && var.module_tags_enabled
    },
    (var.resource_group.enabled && var.module_tags_enabled
      ? {
        arn  = module.resource_group[0].arn
        name = module.resource_group[0].name
      }
      : {}
    )
  )
}
