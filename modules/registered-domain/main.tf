locals {
  metadata = {
    package = "terraform-aws-domain"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = var.name
  }
  module_tags = var.module_tags_enabled ? {
    "module.terraform.io/package"   = local.metadata.package
    "module.terraform.io/version"   = local.metadata.version
    "module.terraform.io/name"      = local.metadata.module
    "module.terraform.io/full-name" = "${local.metadata.package}/${local.metadata.module}"
    "module.terraform.io/instance"  = local.metadata.name
  } : {}
}

locals {
  transfer_lock_unsupported_tlds = [".fi"]
}

###################################################
# Registred Domain in Route53 Registry
###################################################

# INFO: Not supported attributes
# - `name_server.glue_ips`
resource "aws_route53domains_registered_domain" "this" {
  domain_name = var.name

  auto_renew = var.auto_renew_enabled
  transfer_lock = (anytrue([
    for tld in local.transfer_lock_unsupported_tlds :
    endswith(var.name, tld)]
  ) ? false : var.transfer_lock_enabled)


  ## Name Servers
  dynamic "name_server" {
    for_each = var.name_servers

    content {
      name = name_server.value
    }
  }


  ## Privacy Protection
  admin_privacy = var.admin_contact.privacy_protection_enabled
  # billing_privacy    = var.privacy_protection_enabled
  registrant_privacy = var.registrant_contact.privacy_protection_enabled
  tech_privacy       = var.technical_contact.privacy_protection_enabled


  ## Contacts
  admin_contact {
    contact_type      = var.admin_contact.type
    organization_name = var.admin_contact.organization
    first_name        = var.admin_contact.first_name
    last_name         = var.admin_contact.last_name
    email             = var.admin_contact.email
    phone_number      = var.admin_contact.phone
    fax               = var.admin_contact.fax

    country_code   = var.admin_contact.country_code
    state          = var.admin_contact.state
    city           = var.admin_contact.city
    address_line_1 = var.admin_contact.address_line_1
    address_line_2 = var.admin_contact.address_line_2
    zip_code       = var.admin_contact.postal_code

    extra_params = var.admin_contact.extra_params
  }
  billing_contact {
    contact_type      = var.billing_contact.type
    organization_name = var.billing_contact.organization
    first_name        = var.billing_contact.first_name
    last_name         = var.billing_contact.last_name
    email             = var.billing_contact.email
    phone_number      = var.billing_contact.phone
    fax               = var.billing_contact.fax

    country_code   = var.billing_contact.country_code
    state          = var.billing_contact.state
    city           = var.billing_contact.city
    address_line_1 = var.billing_contact.address_line_1
    address_line_2 = var.billing_contact.address_line_2
    zip_code       = var.billing_contact.postal_code

    extra_params = var.admin_contact.extra_params
  }
  registrant_contact {
    contact_type      = var.registrant_contact.type
    organization_name = var.registrant_contact.organization
    first_name        = var.registrant_contact.first_name
    last_name         = var.registrant_contact.last_name
    email             = var.registrant_contact.email
    phone_number      = var.registrant_contact.phone
    fax               = var.registrant_contact.fax

    country_code   = var.registrant_contact.country_code
    state          = var.registrant_contact.state
    city           = var.registrant_contact.city
    address_line_1 = var.registrant_contact.address_line_1
    address_line_2 = var.registrant_contact.address_line_2
    zip_code       = var.registrant_contact.postal_code

    extra_params = var.admin_contact.extra_params
  }
  tech_contact {
    contact_type      = var.technical_contact.type
    organization_name = var.technical_contact.organization
    first_name        = var.technical_contact.first_name
    last_name         = var.technical_contact.last_name
    email             = var.technical_contact.email
    phone_number      = var.technical_contact.phone
    fax               = var.technical_contact.fax

    country_code   = var.technical_contact.country_code
    state          = var.technical_contact.state
    city           = var.technical_contact.city
    address_line_1 = var.technical_contact.address_line_1
    address_line_2 = var.technical_contact.address_line_2
    zip_code       = var.technical_contact.postal_code

    extra_params = var.admin_contact.extra_params
  }


  tags = merge(
    {
      "Name" = local.metadata.name
    },
    local.module_tags,
    var.tags,
  )
}
