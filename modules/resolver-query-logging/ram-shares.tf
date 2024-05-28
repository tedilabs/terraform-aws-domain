###################################################
# Resource Sharing by RAM (Resource Access Manager)
###################################################

module "share" {
  source  = "tedilabs/account/aws//modules/ram-share"
  version = "~> 0.30.4"

  for_each = {
    for share in var.shares :
    share.name => share
  }

  name = "route53-resolver.query-log-config.${var.name}.${each.key}"

  resources = [
    aws_route53_resolver_query_log_config.this.arn,
  ]
  permissions = each.value.permissions

  external_principals_allowed = each.value.external_principals_allowed
  principals                  = each.value.principals

  resource_group_enabled = false
  module_tags_enabled    = false

  tags = merge(
    local.module_tags,
    var.tags,
    each.value.tags,
  )
}
