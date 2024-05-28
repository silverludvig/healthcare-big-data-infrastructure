provider "aws" {
  region = "us-west-2"
}
# 
# Create a VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.3.0"

  name = "hadoop-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = "hadoop-vpc"
  }
}

# Create an EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.0.1"
  cluster_name    = "hadoop-eks-cluster"
  cluster_version = "1.21"

  # EKS Managed Node Groups
  node_groups = {
    hadoop_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"

      key_name = "hadoop-eks-key"
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "hadoop-eks-cluster"
  }
}

# Output the EKS Cluster information
output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_group_arn" {
  value = module.eks.node_groups["hadoop_nodes"].arn
}
