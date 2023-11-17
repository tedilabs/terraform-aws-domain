###################################################
# NS Records
###################################################

resource "aws_route53_record" "ns" {
  for_each = var.ns_records

  zone_id = aws_route53_zone.public.zone_id

  type = "NS"
  name = each.key
  ttl  = each.value.ttl

  records = each.value.values

  allow_overwrite = false

  lifecycle {
    precondition {
      condition     = endswith(each.key, var.name)
      error_message = "The name of NS record must be end with the name of Hosted Zone."
    }
  }
}
