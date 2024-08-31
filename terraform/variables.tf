# Define a variable for the AWS region
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}



variable "environment" {
  description = "The environment for deployment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

# Define a variable for the instance type for the EMR cluster
variable "emr_instance_type" {
  description = "The instance type to use for the EMR cluster nodes"
  type        = string
  default     = "m5.xlarge"
}

# Define a variable for the RDS instance class
variable "rds_instance_class" {
  description = "The instance class to use for the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

# Define a variable for the RDS allocated storage
variable "rds_allocated_storage" {
  description = "The allocated storage in GB for the RDS instance"
  type        = number
  default     = 20
}

# Define a variable for the RDS username
variable "rds_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "admin"
}

# Define a variable for the RDS password (Sensitive)
variable "rds_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "xxxxxxxxxxx"  
