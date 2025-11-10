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

  resource_arn = aws_route53_zone.private.arn

  name       = each.key
  region     = each.value.region
  profile_id = each.value.profile
}
