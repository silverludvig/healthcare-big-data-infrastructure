# Define a variable for the AWS region
variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "eu-north-1"
}

# Use the region variable in the provider block
provider "aws" {
  region = var.region
}
