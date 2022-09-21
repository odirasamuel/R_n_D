terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = { version = "~> 3.4" }
  }
  backend "s3" {
    bucket         = "odi-tf-state-bucket"
    dynamodb_table = "odi-tf-state-lock"
    key            = "odi-tf-state"
    encrypt        = true
    profile        = "odira"
    region         = "us-east-2"
  }
}
provider "aws" {
  region  = "us-east-2"
  profile = "odira"
}