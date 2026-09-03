###################################################
# Associations with Resolver Query Log Configurations
###################################################

# INFO: Not supported attributes
# - `resource_properties`
resource "aws_route53profiles_resource_association" "resolver_query_log_configurations" {
  for_each = {
    for config in var.resolver_query_log_configurations :
    config.name => config
  }

  region = aws_route53profiles_profile.this.region

  profile_id = aws_route53profiles_profile.this.id

  name         = each.key
  resource_arn = each.value.resolver_query_log_configuration
}


###################################################
# Associations with DNS Firewall Rule Groups
###################################################

resource "aws_route53profiles_resource_association" "dns_firewall_rule_groups" {
  for_each = {
    for rule_group in var.dns_firewall_rule_groups :
    rule_group.name => rule_group
  }

  region = aws_route53profiles_profile.this.region

  profile_id = aws_route53profiles_profile.this.id

  name         = each.key
  resource_arn = each.value.dns_firewall_rule_group
  resource_properties = jsonencode({
    priority = each.value.priority
  })
}
