

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.50"
        }
    }
}

provider "aws" {}


resource "aws_s3_bucket" "bucket" {
    bucket = "yoav-opensearch-snapshot"
}
