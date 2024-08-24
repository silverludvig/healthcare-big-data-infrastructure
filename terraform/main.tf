# Define a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Define a Subnet within the VPC
resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1a"  # Adjust the availability zone as needed
}

# Define a Security Group for the EMR cluster
resource "aws_security_group" "emr_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define an RDS instance
resource "aws_rds_instance" "healthcare_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "healthcare"
  username             = "admin"
  password             = "RDS-Password#123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.emr_sg.id]
}

# Define an EMR cluster with Spark
resource "aws_emr_cluster" "emr_cluster" {
  name          = "EMR-Healthcare-Data"
  release_label = "emr-5.32.0"

  applications = [
    "Spark",
  ]

  ec2_attributes {
    subnet_id                       = aws_subnet.main_subnet.id
    emr_managed_master_security_group = aws_security_group.emr_sg.id
    emr_managed_slave_security_group  = aws_security_group.emr_sg.id
  }

  master_instance_group {
    instance_type = "m5.xlarge"
    instance_count = 1
  }

  core_instance_group {
    instance_type = "m5.xlarge"
    instance_count = 2
  }

  service_role = aws_iam_role.emr_service_role.arn
}

# Define IAM role for EMR
resource "aws_iam_role" "emr_service_role" {
  name = "EMR_Service_Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticmapreduce.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach policy to the IAM role for EMR
resource "aws_iam_role_policy_attachment" "emr_service_policy_attachment" {
  role       = aws_iam_role.emr_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
}



resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}
