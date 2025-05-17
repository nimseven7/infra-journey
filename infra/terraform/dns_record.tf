data "gandi_domain" "nimseven" {
  name = "nimseven.dev"
}

resource "gandi_livedns_record" "app_server" {
  zone = data.gandi_domain.nimseven.id
  name = "server1"
  type = "CNAME"
  ttl  = 300

  values = ["${aws_instance.app_server.public_dns}."]
  # value = aws_instance.app_server.public_ip
  depends_on = [aws_instance.app_server]
}