/* # Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/joseph/.aws/credentials"
  profile                 = "default"
}

resource "aws_db_instance" "example" {
    engine            = "mysql"
    allocated_storage = 10
    instance_class    = "db.t2.micro"
    name              = "example_database"
    username          = "admin"
    password          = "${var.db_password}"
} */