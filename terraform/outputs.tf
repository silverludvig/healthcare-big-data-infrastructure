# Output the RDS endpoint
output "rds_endpoint" {
  description = "The endpoint of the Amazon RDS instance"
  value       = aws_rds_instance.healthcare_db.endpoint.address
}

# Output the EMR cluster ID
output "emr_cluster_id" {
  description = "The ID of the Amazon EMR cluster"
  value       = aws_emr_cluster.emr_cluster.id
}
