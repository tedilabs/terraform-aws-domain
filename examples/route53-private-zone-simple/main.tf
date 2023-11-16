provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}


###################################################
# Route53 Private Hosted Zone
###################################################

module "zone" {
  source = "../../modules/private-zone/"
  # source  = "tedilabs/domain/aws//modules/private-zone"
  # version = "~> 0.2.0"

  name = "mycompany.com"

  primary_vpc_association = {
    vpc_id = data.aws_vpc.default.id
  }

  tags = {
    "project" = "terraform-aws-domain-examples"
  }
}
