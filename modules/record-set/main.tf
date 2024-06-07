data "aws_route53_zone" "this" {
  zone_id = var.zone
}


###################################################
# Record Set
###################################################

# TODO: `health_check_id` - (Optional) The health check the record should be associated with.

# TODO: `cidr_routing_policy` - (Optional) A block indicating a routing policy based on the IP network ranges of requestors. Conflicts with any other routing policy. Documented below.
# TODO: `failover_routing_policy` - (Optional) A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy. Documented below.
# TODO: `geolocation_routing_policy` - (Optional) A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy. Documented below.
# TODO: `geoproximity_routing_policy` - (Optional) A block indicating a routing policy based on the geoproximity of the requestor. Conflicts with any other routing policy. Documented below.
# TODO: `latency_routing_policy` - (Optional) A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy. Documented below.
# TODO: `multivalue_answer_routing_policy` - (Optional) Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy.
# TODO: `weighted_routing_policy` - (Optional) A block indicating a weighted routing policy. Conflicts with any other routing policy. Documented below.
resource "aws_route53_record" "this" {
  for_each = {
    for record in var.records :
    record.id => record
  }

  zone_id         = var.zone
  name            = var.name
  type            = var.type
  ttl             = var.ttl
  allow_overwrite = var.overwrite

  set_identifier = (var.routing_policy == "SIMPLE"
    ? null
    : each.value.id
  )

  ## Record
  # Non-alias Record
  records = (var.type == "TXT"
    ? [
      for v in each.value.value :
      join("\"\"", [
        for idx in range(0, length(v), 255) :
        substr(v, idx, 255)
      ])
    ]
    : each.value.value
  )

  # Alias Record
  dynamic "alias" {
    for_each = each.value.alias != null ? [each.value.alias] : []

    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }


  # lifecycle {
  #   precondition {
  #     condition     = endswith(each.key, var.name)
  #     error_message = "The name of NS record must be end with the name of Hosted Zone."
  #   }
  # }
}
