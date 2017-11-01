# Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/joseph/.aws/credentials"
  profile                 = "default"
}

# Create a web server
resource "aws_instance" "web" {
  ami                     = "ami-40d28157"
  instance_type           = "t2.micro"
  vpc_security_group      = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
  tags {
      Name = "web-1"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance" 

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}