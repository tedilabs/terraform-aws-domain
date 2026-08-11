provider "aws" {
  region = "us-east-1"
}


###################################################
# Route53 Public Hosted Zone
###################################################

module "zone" {
  source = "../../modules/public-zone/"
  # source  = "tedilabs/domain/aws//modules/public-zone"
  # version = "~> 1.0.0"

  name = "mycompany.com"

  tags = {
    "project" = "terraform-aws-domain-examples"
  }
}
