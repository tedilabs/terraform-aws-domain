# terraform-aws-domain

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/tedilabs/terraform-aws-domain?color=blue&sort=semver&style=flat-square)
![GitHub](https://img.shields.io/github/license/tedilabs/terraform-aws-domain?color=blue&style=flat-square)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=flat-square)](https://github.com/pre-commit/pre-commit)

Terraform module which creates Route53 related resources on AWS.

- [amazon-issued-cert](./modules/amazon-issued-cert)
- [cidr-collection](./modules/cidr-collection/)
- [imported-cert](./modules/imported-cert)
- [private-ca-issued-cert](./modules/private-ca-issued-cert)
- [private-zone](./modules/private-zone)
- [public-zone](./modules/public-zone)
- [record-set](./modules/record-set)
- [registered-domain](./modules/registered-domain)
- [resolver-inbound-endpoint](./modules/resolver-inbound-endpoint)
- [resolver-query-logging](./modules/resolver-query-logging)


## Target AWS Services

Terraform Modules from [this package](https://github.com/tedilabs/terraform-aws-domain) were written to manage the following AWS Services with Terraform.

- **Route53**
  - Registrar
    - Registered Domain
  - Hosted Zone
    - Public Hosted Zone
    - Private Hosted Zone
    - Record Set
    - CIDR Collection
  - Resolver
    - Inbound Endpoint
    - Outbound Endpoint (comming soon!)
    - Query Logging Configuration
- **ACM (AWS Certificate Manager)**
  - Amazon issued Certificate
  - Private CA issued Certificate
  - Imported Certificate


## Examples

### Route53

- [route53-private-zone-simple](./examples/route53-private-zone-simple/)
- [route53-public-zone-simple](./examples/route53-public-zone-simple/)


## Self Promotion

Like this project? Follow the repository on [GitHub](https://github.com/tedilabs/terraform-aws-domain). And if you're feeling especially charitable, follow **[posquit0](https://github.com/posquit0)** on GitHub.


## License

Provided under the terms of the [Apache License](LICENSE).

Copyright © 2021-2023, [Byungjin Park](https://www.posquit0.com).
