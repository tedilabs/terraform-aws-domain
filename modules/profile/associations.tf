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
