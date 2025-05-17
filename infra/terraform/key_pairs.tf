resource "aws_key_pair" "mino_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_ed25519.pub")
}