resource "aws_acm_certificate" "cert" {
  domain_name = "*.${var.environment_name}.${var.hosted_zone}"
  subject_alternative_names = [
    "*.apps.${var.environment_name}.${var.hosted_zone}",
    "*.sys.${var.environment_name}.${var.hosted_zone}",
    "*.uaa.sys.${var.environment_name}.${var.hosted_zone}",
    "*.login.sys.${var.environment_name}.${var.hosted_zone}",
    "*.pks.${var.environment_name}.${var.hosted_zone}",
    "*.tkgi.${var.environment_name}.${var.hosted_zone}",
  ]
  validation_method = "DNS"

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment_name}-acm"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  name    = aws_acm_certificate.cert.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[0].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[0].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt1" {
  name    = aws_acm_certificate.cert.domain_validation_options[1].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[1].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[1].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt2" {
  name    = aws_acm_certificate.cert.domain_validation_options[2].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[2].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[2].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt3" {
  name    = aws_acm_certificate.cert.domain_validation_options[3].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[3].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[3].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt4" {
  name    = aws_acm_certificate.cert.domain_validation_options[4].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[4].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[4].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt5" {
  name    = aws_acm_certificate.cert.domain_validation_options[5].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[5].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[5].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_route53_record" "cert_validation_alt6" {
  name    = aws_acm_certificate.cert.domain_validation_options[6].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[6].resource_record_type
  zone_id = data.aws_route53_zone.hosted.zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options[6].resource_record_value
  ]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    aws_route53_record.cert_validation.fqdn,
    aws_route53_record.cert_validation_alt1.fqdn,
    aws_route53_record.cert_validation_alt2.fqdn,
    aws_route53_record.cert_validation_alt3.fqdn,
    aws_route53_record.cert_validation_alt4.fqdn,
    aws_route53_record.cert_validation_alt5.fqdn,
    aws_route53_record.cert_validation_alt6.fqdn,
  ]
}