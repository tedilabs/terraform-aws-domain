variable "name" {
  description = "(Required) The name of the registred domain."
  type        = string
  nullable    = false
}

variable "auto_renew_enabled" {
  description = "(Optional) Whether the domain registration is set to renew automatically. Defaults to `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "transfer_lock_enabled" {
  description = "(Optional) Whether the domain is locked for transfer. Defaults to `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "name_servers" {
  description = <<EOF
  (Optional) A set of fully qualified host name of name servers for the registered domain.
  EOF
  type        = set(string)
  default     = []
  nullable    = false
}

variable "admin_contact" {
  description = <<EOF
  (Optional) The configuration of the domain administrative contact. `admin_contact` as defined below.
    (Optional) `type` - Whether the contact is a person, company, association, or public organization.  Valid values are `PERSON`, `COMPANY`, `ASSOCIATION`, or `PUBLIC_BODY`, `RESELLER`. Defaults to `PERSON`.
    (Optional) `organization` - The name of the organization for contact types other than `PERSON`.
    (Optional) `first_name` - First name of contact.
    (Optional) `last_name` - Last name of contact.
    (Optional) `email` - The email address of the contact.
    (Optional) `phone` - The phone number of the contact. Phone number must be specified in the format `+[country dialing code].[number including any area code]`.
    (Optional) `fax` - The fax number of the contact. Fax number must be specified in the format `+[country dialing code].[number including any area code]`.

    (Optional) `country_code` - The ISO-3166 two-letter country code for the contact address.
    (Optional) `state` - The state or province of the contact's city.
    (Optional) `city` - The city of the contact's address.
    (Optional) `address_line_1` - The first line of the contact address.
    (Optional) `address_line_2` - The second line of the contact address, if any.
    (Optional) `postal_code` - The zip or postal code of the contact's address.

    (Optional) `extra_params` - A key-value map of parameters required by certain top-level domains.
    (Optional) `privacy_protection_enabled` - Whether domain contact information is concealed from WHOIS queries. Defaults to `true`.
  EOF
  type = object({
    type         = optional(string, "PERSON")
    organization = optional(string)
    first_name   = optional(string)
    last_name    = optional(string)
    email        = optional(string)
    phone        = optional(string)
    fax          = optional(string)

    country_code   = optional(string)
    state          = optional(string)
    city           = optional(string)
    address_line_1 = optional(string)
    address_line_2 = optional(string)
    postal_code    = optional(string)

    extra_params               = optional(map(string), {})
    privacy_protection_enabled = optional(bool, true)
  })
  default  = {}
  nullable = false

  validation {
    condition = contains([
      "PERSON",
      "COMPANY",
      "ASSOCIATION",
      "PUBLIC_BODY",
      "RESELLER"
    ], var.admin_contact.type)
    error_message = "Valid values for `type` are `PERSON`, `COMPANY`, `ASSOCIATION`, `PUBLIC_BODY`, or `RESELLER`."
  }
  validation {
    condition = anytrue([
      var.admin_contact.phone == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.admin_contact.phone
      )),
    ])
    error_message = "The phone number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
  validation {
    condition = anytrue([
      var.admin_contact.fax == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.admin_contact.fax
      )),
    ])
    error_message = "The fax number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
}

variable "billing_contact" {
  description = <<EOF
  (Optional) The configuration of the domain billing contact. `billing_contact` as defined below.
    (Optional) `type` - Whether the contact is a person, company, association, or public organization.  Valid values are `PERSON`, `COMPANY`, `ASSOCIATION`, or `PUBLIC_BODY`, `RESELLER`. Defaults to `PERSON`.
    (Optional) `organization` - The name of the organization for contact types other than `PERSON`.
    (Optional) `first_name` - First name of contact.
    (Optional) `last_name` - Last name of contact.
    (Optional) `email` - The email address of the contact.
    (Optional) `phone` - The phone number of the contact. Phone number must be specified in the format `+[country dialing code].[number including any area code]`.
    (Optional) `fax` - The fax number of the contact. Fax number must be specified in the format `+[country dialing code].[number including any area code]`.

    (Optional) `country_code` - The ISO-3166 two-letter country code for the contact address.
    (Optional) `state` - The state or province of the contact's city.
    (Optional) `city` - The city of the contact's address.
    (Optional) `address_line_1` - The first line of the contact address.
    (Optional) `address_line_2` - The second line of the contact address, if any.
    (Optional) `postal_code` - The zip or postal code of the contact's address.

    (Optional) `extra_params` - A key-value map of parameters required by certain top-level domains.
    (Optional) `privacy_protection_enabled` - Whether domain contact information is concealed from WHOIS queries. Defaults to `true`.
  EOF
  type = object({
    type         = optional(string, "PERSON")
    organization = optional(string)
    first_name   = optional(string)
    last_name    = optional(string)
    email        = optional(string)
    phone        = optional(string)
    fax          = optional(string)

    country_code   = optional(string)
    state          = optional(string)
    city           = optional(string)
    address_line_1 = optional(string)
    address_line_2 = optional(string)
    postal_code    = optional(string)

    extra_params               = optional(map(string), {})
    privacy_protection_enabled = optional(bool, true)
  })
  default  = {}
  nullable = false

  validation {
    condition = contains([
      "PERSON",
      "COMPANY",
      "ASSOCIATION",
      "PUBLIC_BODY",
      "RESELLER"
    ], var.billing_contact.type)
    error_message = "Valid values for `type` are `PERSON`, `COMPANY`, `ASSOCIATION`, `PUBLIC_BODY`, or `RESELLER`."
  }
  validation {
    condition = anytrue([
      var.billing_contact.phone == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.billing_contact.phone
      )),
    ])
    error_message = "The phone number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
  validation {
    condition = anytrue([
      var.billing_contact.fax == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.billing_contact.fax
      )),
    ])
    error_message = "The fax number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
}

variable "registrant_contact" {
  description = <<EOF
  (Optional) The configuration of the domain registrant contact. `registrant_contact` as defined below.
    (Optional) `type` - Whether the contact is a person, company, association, or public organization.  Valid values are `PERSON`, `COMPANY`, `ASSOCIATION`, or `PUBLIC_BODY`, `RESELLER`. Defaults to `PERSON`.
    (Optional) `organization` - The name of the organization for contact types other than `PERSON`.
    (Optional) `first_name` - First name of contact.
    (Optional) `last_name` - Last name of contact.
    (Optional) `email` - The email address of the contact.
    (Optional) `phone` - The phone number of the contact. Phone number must be specified in the format `+[country dialing code].[number including any area code]`.
    (Optional) `fax` - The fax number of the contact. Fax number must be specified in the format `+[country dialing code].[number including any area code]`.

    (Optional) `country_code` - The ISO-3166 two-letter country code for the contact address.
    (Optional) `state` - The state or province of the contact's city.
    (Optional) `city` - The city of the contact's address.
    (Optional) `address_line_1` - The first line of the contact address.
    (Optional) `address_line_2` - The second line of the contact address, if any.
    (Optional) `postal_code` - The zip or postal code of the contact's address.

    (Optional) `extra_params` - A key-value map of parameters required by certain top-level domains.
    (Optional) `privacy_protection_enabled` - Whether domain contact information is concealed from WHOIS queries. Defaults to `true`.
  EOF
  type = object({
    type         = optional(string, "PERSON")
    organization = optional(string)
    first_name   = optional(string)
    last_name    = optional(string)
    email        = optional(string)
    phone        = optional(string)
    fax          = optional(string)

    country_code   = optional(string)
    state          = optional(string)
    city           = optional(string)
    address_line_1 = optional(string)
    address_line_2 = optional(string)
    postal_code    = optional(string)

    extra_params               = optional(map(string), {})
    privacy_protection_enabled = optional(bool, true)
  })
  default  = {}
  nullable = false

  validation {
    condition = contains([
      "PERSON",
      "COMPANY",
      "ASSOCIATION",
      "PUBLIC_BODY",
      "RESELLER"
    ], var.registrant_contact.type)
    error_message = "Valid values for `type` are `PERSON`, `COMPANY`, `ASSOCIATION`, `PUBLIC_BODY`, or `RESELLER`."
  }
  validation {
    condition = anytrue([
      var.registrant_contact.phone == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.registrant_contact.phone
      )),
    ])
    error_message = "The phone number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
  validation {
    condition = anytrue([
      var.registrant_contact.fax == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.registrant_contact.fax
      )),
    ])
    error_message = "The fax number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
}

variable "technical_contact" {
  description = <<EOF
  (Optional) The configuration of the domain technical contact. `technical_contact` as defined below.
    (Optional) `type` - Whether the contact is a person, company, association, or public organization.  Valid values are `PERSON`, `COMPANY`, `ASSOCIATION`, or `PUBLIC_BODY`, `RESELLER`. Defaults to `PERSON`.
    (Optional) `organization` - The name of the organization for contact types other than `PERSON`.
    (Optional) `first_name` - First name of contact.
    (Optional) `last_name` - Last name of contact.
    (Optional) `email` - The email address of the contact.
    (Optional) `phone` - The phone number of the contact. Phone number must be specified in the format `+[country dialing code].[number including any area code]`.
    (Optional) `fax` - The fax number of the contact. Fax number must be specified in the format `+[country dialing code].[number including any area code]`.

    (Optional) `country_code` - The ISO-3166 two-letter country code for the contact address.
    (Optional) `state` - The state or province of the contact's city.
    (Optional) `city` - The city of the contact's address.
    (Optional) `address_line_1` - The first line of the contact address.
    (Optional) `address_line_2` - The second line of the contact address, if any.
    (Optional) `postal_code` - The zip or postal code of the contact's address.

    (Optional) `extra_params` - A key-value map of parameters required by certain top-level domains.
    (Optional) `privacy_protection_enabled` - Whether domain contact information is concealed from WHOIS queries. Defaults to `true`.
  EOF
  type = object({
    type         = optional(string, "PERSON")
    organization = optional(string)
    first_name   = optional(string)
    last_name    = optional(string)
    email        = optional(string)
    phone        = optional(string)
    fax          = optional(string)

    country_code   = optional(string)
    state          = optional(string)
    city           = optional(string)
    address_line_1 = optional(string)
    address_line_2 = optional(string)
    postal_code    = optional(string)

    extra_params               = optional(map(string), {})
    privacy_protection_enabled = optional(bool, true)
  })
  default  = {}
  nullable = false

  validation {
    condition = contains([
      "PERSON",
      "COMPANY",
      "ASSOCIATION",
      "PUBLIC_BODY",
      "RESELLER"
    ], var.technical_contact.type)
    error_message = "Valid values for `type` are `PERSON`, `COMPANY`, `ASSOCIATION`, `PUBLIC_BODY`, or `RESELLER`."
  }
  validation {
    condition = anytrue([
      var.technical_contact.phone == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.technical_contact.phone
      )),
    ])
    error_message = "The phone number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
  validation {
    condition = anytrue([
      var.technical_contact.fax == null,
      can(regex(
        "^\\+[0-9]+\\.[0-9]+$",
        var.technical_contact.fax
      )),
    ])
    error_message = "The fax number must be specified in the format `+[country dialing code].[number including any area code]`."
  }
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "module_tags_enabled" {
  description = "(Optional) Whether to create AWS Resource Tags for the module informations."
  type        = bool
  default     = true
  nullable    = false
}


###################################################
# Resource Group
###################################################

variable "resource_group_enabled" {
  description = "(Optional) Whether to create Resource Group to find and group AWS resources which are created by this module."
  type        = bool
  default     = true
  nullable    = false
}

variable "resource_group_name" {
  description = "(Optional) The name of Resource Group. A Resource Group name can have a maximum of 127 characters, including letters, numbers, hyphens, dots, and underscores. The name cannot start with `AWS` or `aws`."
  type        = string
  default     = ""
  nullable    = false
}

variable "resource_group_description" {
  description = "(Optional) The description of Resource Group."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}
