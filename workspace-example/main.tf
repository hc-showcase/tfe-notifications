provider "aws" {
}

resource "aws_vpc" "example" {
  cidr_block     = "10.0.0.0/16"
}

resource "aws_instance" "example" {
  instance_type  = "t2.micro"
  ami            = "ami-0d359437d1756caa8"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-lkjahk3333"
  acl    = "private"

  tags = {
    Name        = "My bucket"
  }
}
