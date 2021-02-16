resource "aws_route53_zone" "public" {
  name          = var.name
  comment       = var.comment
  force_destroy = var.force_destroy

  delegation_set_id = var.delegation_set_id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}
