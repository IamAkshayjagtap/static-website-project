provider "aws" {
  region = var.region
}

resource "aws_key_pair" "project_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "web_sg" {
  name        = "static_web_sg"
  description = "Allow HTTP and SSH"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.project_key.key_name
  security_groups = [aws_security_group.web_sg.name]

  user_data = file("userdata.sh")

  tags = {
    Name = "Static-Website-Server"
  }
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}
