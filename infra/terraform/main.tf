resource "aws_instance" "app_server" {
  ami             = "ami-0b7e05c6022fc830b"
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.mino_key_pair.key_name
  security_groups = [aws_security_group.app_sg.name]

  user_data = file("user_data.sh")

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

