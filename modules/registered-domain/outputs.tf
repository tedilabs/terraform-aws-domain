output "id" {
  description = "The ID of the registered domain."
  value       = aws_route53domains_registered_domain.this.id
}

output "name" {
  description = "The name of the registered domain."
  value       = aws_route53domains_registered_domain.this.domain_name
}

output "auto_renew_enabled" {
  description = "Whether the domain registration is set to renew automatically."
  value       = aws_route53domains_registered_domain.this.auto_renew
}

output "transfer_lock_enabled" {
  description = "Whether the domain is locked for transfer."
  value       = aws_route53domains_registered_domain.this.transfer_lock
}

output "name_servers" {
  description = "A list of name servers for the registered domain."
  value       = aws_route53domains_registered_domain.this.name_server[*].name
}

output "admin_contact" {
  description = "The configuration of the domain administrative contact."
  value = {
    type         = one(aws_route53domains_registered_domain.this.admin_contact[*].contact_type)
    organization = one(aws_route53domains_registered_domain.this.admin_contact[*].organization_name)
    first_name   = one(aws_route53domains_registered_domain.this.admin_contact[*].first_name)
    last_name    = one(aws_route53domains_registered_domain.this.admin_contact[*].last_name)
    email        = one(aws_route53domains_registered_domain.this.admin_contact[*].email)
    phone        = one(aws_route53domains_registered_domain.this.admin_contact[*].phone_number)
    fax          = one(aws_route53domains_registered_domain.this.admin_contact[*].fax)

    country_code   = one(aws_route53domains_registered_domain.this.admin_contact[*].country_code)
    state          = one(aws_route53domains_registered_domain.this.admin_contact[*].state)
    city           = one(aws_route53domains_registered_domain.this.admin_contact[*].city)
    address_line_1 = one(aws_route53domains_registered_domain.this.admin_contact[*].address_line_1)
    address_line_2 = one(aws_route53domains_registered_domain.this.admin_contact[*].address_line_2)
    postal_code    = one(aws_route53domains_registered_domain.this.admin_contact[*].zip_code)

    extra_prams                = one(aws_route53domains_registered_domain.this.admin_contact[*].extra_params)
    privacy_protection_enabled = aws_route53domains_registered_domain.this.admin_privacy
  }
}

output "billing_contact" {
  description = "The configuration of the domain billing contact."
  value = {
    type         = one(aws_route53domains_registered_domain.this.billing_contact[*].contact_type)
    organization = one(aws_route53domains_registered_domain.this.billing_contact[*].organization_name)
    first_name   = one(aws_route53domains_registered_domain.this.billing_contact[*].first_name)
    last_name    = one(aws_route53domains_registered_domain.this.billing_contact[*].last_name)
    email        = one(aws_route53domains_registered_domain.this.billing_contact[*].email)
    phone        = one(aws_route53domains_registered_domain.this.billing_contact[*].phone_number)
    fax          = one(aws_route53domains_registered_domain.this.billing_contact[*].fax)

    country_code   = one(aws_route53domains_registered_domain.this.billing_contact[*].country_code)
    state          = one(aws_route53domains_registered_domain.this.billing_contact[*].state)
    city           = one(aws_route53domains_registered_domain.this.billing_contact[*].city)
    address_line_1 = one(aws_route53domains_registered_domain.this.billing_contact[*].address_line_1)
    address_line_2 = one(aws_route53domains_registered_domain.this.billing_contact[*].address_line_2)
    postal_code    = one(aws_route53domains_registered_domain.this.billing_contact[*].zip_code)

    extra_prams                = one(aws_route53domains_registered_domain.this.billing_contact[*].extra_params)
    privacy_protection_enabled = aws_route53domains_registered_domain.this.billing_privacy
  }
}

output "registrant_contact" {
  description = "The configuration of the domain registrant contact."
  value = {
    type         = one(aws_route53domains_registered_domain.this.registrant_contact[*].contact_type)
    organization = one(aws_route53domains_registered_domain.this.registrant_contact[*].organization_name)
    first_name   = one(aws_route53domains_registered_domain.this.registrant_contact[*].first_name)
    last_name    = one(aws_route53domains_registered_domain.this.registrant_contact[*].last_name)
    email        = one(aws_route53domains_registered_domain.this.registrant_contact[*].email)
    phone        = one(aws_route53domains_registered_domain.this.registrant_contact[*].phone_number)
    fax          = one(aws_route53domains_registered_domain.this.registrant_contact[*].fax)

    country_code   = one(aws_route53domains_registered_domain.this.registrant_contact[*].country_code)
    state          = one(aws_route53domains_registered_domain.this.registrant_contact[*].state)
    city           = one(aws_route53domains_registered_domain.this.registrant_contact[*].city)
    address_line_1 = one(aws_route53domains_registered_domain.this.registrant_contact[*].address_line_1)
    address_line_2 = one(aws_route53domains_registered_domain.this.registrant_contact[*].address_line_2)
    postal_code    = one(aws_route53domains_registered_domain.this.registrant_contact[*].zip_code)

    extra_prams                = one(aws_route53domains_registered_domain.this.registrant_contact[*].extra_params)
    privacy_protection_enabled = aws_route53domains_registered_domain.this.registrant_privacy
  }
}

output "technical_contact" {
  description = "The configuration of the domain technical contact."
  value = {
    type         = one(aws_route53domains_registered_domain.this.tech_contact[*].contact_type)
    organization = one(aws_route53domains_registered_domain.this.tech_contact[*].organization_name)
    first_name   = one(aws_route53domains_registered_domain.this.tech_contact[*].first_name)
    last_name    = one(aws_route53domains_registered_domain.this.tech_contact[*].last_name)
    email        = one(aws_route53domains_registered_domain.this.tech_contact[*].email)
    phone        = one(aws_route53domains_registered_domain.this.tech_contact[*].phone_number)
    fax          = one(aws_route53domains_registered_domain.this.tech_contact[*].fax)

    country_code   = one(aws_route53domains_registered_domain.this.tech_contact[*].country_code)
    state          = one(aws_route53domains_registered_domain.this.tech_contact[*].state)
    city           = one(aws_route53domains_registered_domain.this.tech_contact[*].city)
    address_line_1 = one(aws_route53domains_registered_domain.this.tech_contact[*].address_line_1)
    address_line_2 = one(aws_route53domains_registered_domain.this.tech_contact[*].address_line_2)
    postal_code    = one(aws_route53domains_registered_domain.this.tech_contact[*].zip_code)

    extra_prams                = one(aws_route53domains_registered_domain.this.tech_contact[*].extra_params)
    privacy_protection_enabled = aws_route53domains_registered_domain.this.tech_privacy
  }
}

output "abuse_contact" {
  description = "The contact informations to report incorrect contact information for a domain, to report that the domain is being used to send spam, to report that someone is cybersquatting on a domain name, or report some other type of abuse."
  value = {
    email = aws_route53domains_registered_domain.this.abuse_contact_email
    phoen = aws_route53domains_registered_domain.this.abuse_contact_phone
  }
}

output "registrar" {
  description = "The informations about the registrar for the domain."
  value = {
    name = aws_route53domains_registered_domain.this.registrar_name
    url  = aws_route53domains_registered_domain.this.registrar_url
  }
}

output "reseller" {
  description = "Reseller of the domain."
  value       = aws_route53domains_registered_domain.this.reseller
}

output "whois_server" {
  description = "The fully qualified name of the WHOIS server that can answer the WHOIS query for the domain."
  value       = aws_route53domains_registered_domain.this.whois_server
}

output "status_codes" {
  description = "A list of domain name status codes."
  value       = aws_route53domains_registered_domain.this.status_list
}

output "created_at" {
  description = "The date when the domain was created as found in the response to a WHOIS query."
  value       = aws_route53domains_registered_domain.this.creation_date
}

output "expired_at" {
  description = "The date when the registration for the domain is set to expire."
  value       = aws_route53domains_registered_domain.this.expiration_date
}

output "updated_at" {
  description = "The last updated date of the domain as found in the response to a WHOIS query."
  value       = aws_route53domains_registered_domain.this.updated_date
}

# output "debug" {
#   value = {
#     for k, v in aws_route53domains_registered_domain.this :
#     k => v
#     if !contains(["id", "domain_name", "tags", "tags_all", "auto_renew", "transfer_lock", "timeouts", "creation_date", "expiration_date", "updated_date", "registrar_name", "registrar_url", "whois_server", "reseller", "abuse_contact_email", "abuse_contact_phone", "admin_contact", "registrant_contact", "tech_contact", "admin_privacy", "registrant_privacy", "tech_privacy", "billing_contact", "billing_privacy", "status_list"], k)
#   }
# }

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
