# Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/joseph/.aws/credentials"
  profile                 = "default"
}

# Create a web server
resource "aws_instance" "web" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"

  tags {
      Name = "web-1"
  }
}