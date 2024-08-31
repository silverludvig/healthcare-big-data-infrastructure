provider "aws" {
  region  = "eu-north-1"
  version = "~> 4.0"

}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
