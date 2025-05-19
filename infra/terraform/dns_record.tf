#### Terraform DNS Record Configuration ####
# This file contains the configuration for DNS records using different providers
# based on the selected domain provider.
# The configuration is designed to work with either Gandi or Cloudflare as the DNS provider.


## Gandi DNS Record Configuration ##
data "gandi_domain" "nimseven" {
  count = var.domain_provider == "gandi" ? 1 : 0
  name  = "nimseven.dev"
}

resource "gandi_livedns_record" "app_server" {
  count = var.domain_provider == "gandi" ? 1 : 0
  zone  = data.gandi_domain.nimseven[0].id
  name  = var.servername
  type  = "CNAME"
  ttl   = 300

  values = ["${aws_instance.app_server.public_dns}."]
  # value = aws_instance.app_server.public_ip
  depends_on = [aws_instance.app_server]
}

resource "gandi_livedns_record" "app_server_superset" {
  count = var.domain_provider == "gandi" ? 1 : 0
  zone  = data.gandi_domain.nimseven[0].id
  name  = "superset-${var.servername}"
  type  = "CNAME"
  ttl   = 300

  values = ["${aws_instance.app_server.public_dns}."]
  # value = aws_instance.app_server.public_ip
  depends_on = [aws_instance.app_server]
}

## Gandi end ##
## Cloudflare DNS Record Configuration ##
data "cloudflare_zone" "vianeo_com" {
  count   = var.domain_provider == "cloudflare" ? 1 : 0
  zone_id = var.domain_zone_id
}

resource "cloudflare_dns_record" "app_server" {
  count   = var.domain_provider == "cloudflare" ? 1 : 0
  zone_id = data.cloudflare_zone.vianeo_com[0].zone_id
  name    = "${var.servername}.${var.domain_name}"
  comment = "Terraform managed record"
  content = "${aws_instance.app_server.public_dns}"
  type    = "CNAME"
  proxied = false
  ttl     = 300

  depends_on = [aws_instance.app_server]
}

resource "cloudflare_dns_record" "app_server_superset" {
  count   = var.domain_provider == "cloudflare" ? 1 : 0
  zone_id = data.cloudflare_zone.vianeo_com[0].zone_id
  name    = "superset-${var.servername}.${var.domain_name}"
  comment = "Terraform managed record"
  content = "${aws_instance.app_server.public_dns}"
  type    = "CNAME"
  proxied = false
  ttl     = 300

  depends_on = [aws_instance.app_server]
}