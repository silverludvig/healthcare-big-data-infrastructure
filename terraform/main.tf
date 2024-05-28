provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "patient_data" {
  bucket = "healthcare-patient-data"
  acl    = "private"

  tags = {
    Name = "patient_data_bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.patient_data.id
}
