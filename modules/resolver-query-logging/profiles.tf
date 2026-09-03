###################################################
# Associations with Route53 Profiles
###################################################

# INFO: Not supported attributes
# - `resource_properties`
resource "aws_route53profiles_resource_association" "this" {
  for_each = {
    for assoc in var.profile_associations :
    assoc.name => assoc
  }

  region = var.region

  resource_arn = aws_route53_resolver_query_log_config.this.arn

  name       = each.key
  profile_id = each.value.profile
}
