terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" # define region as per your account
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = "deployment-django-${random_id.new.id}"

  object_lock_enabled = false

  tags = {
    Environment = "Prod"
  }
}

resource "random_id" "new" {
  byte_length = 8
}
