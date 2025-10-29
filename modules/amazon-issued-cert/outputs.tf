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

output "key_algorithm" {
  description = "The algorithm of the public and private key pair to encrypt data."
  value = {
    for k, v in local.key_algorithms :
    v => k
  }[aws_acm_certificate.this.key_algorithm]
}

output "certificate_transparency_logging_enabled" {
  description = "Whether or not the certificate transparency logging is enabled."
  value       = var.certificate_transparency_logging_enabled
}

output "export_enabled" {
  description = "Whether the certificate can be exported."
  value       = var.export_enabled
}

output "effective_date" {
  description = "Effective date and time of the certificate. Start of the validity period of the certificate."
  value       = aws_acm_certificate.this.not_before
}

output "expiration_date" {
  description = "Expiration date and time of the certificate."
  value       = aws_acm_certificate.this.not_after
}

output "validation" {
  description = <<EOF
  The configuration for the certificate validation.
    `method` - The method to use to validate the domain ownership for requesting a public certificate.
    `domain_records` - A map of domain validation records which can be used to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if `validation.method` is `DNS`.
    `emails` - A list of addresses that received a validation E-Mail. Only set if `validation.method` is `EMAIL`.
  EOF
  value = {
    method = aws_acm_certificate.this.validation_method
    domain_records = (aws_acm_certificate.this.validation_method == "DNS"
      ? {
        for option in aws_acm_certificate.this.domain_validation_options :
        option.domain_name => {
          name  = option.resource_record_name
          type  = option.resource_record_type
          value = option.resource_record_value
        }
      }
      : {}
    )
    emails = (aws_acm_certificate.this.validation_method == "EMAIL"
      ? aws_acm_certificate.this.validation_emails
      : []
    )
  }
}

output "renewal" {
  description = <<EOF
  The configuration for the certificate renewal.
    `eligibility` - Whether the certificate is eligible for managed renewal.
    `summary` - The information about the status of ACM's managed renewal for the certificate.
  EOF
  value = {
    eligibility = aws_acm_certificate.this.renewal_eligibility
    summary     = aws_acm_certificate.this.renewal_summary
  }
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
