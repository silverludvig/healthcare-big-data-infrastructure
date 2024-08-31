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

# Output the Jenkins server public IP
output "jenkins_server_public_ip" {
  description = "The public IP address of the Jenkins server"
  value       = aws_instance.jenkins_server.public_ip
}

# Output the Jenkins server URL
output "jenkins_server_url" {
  description = "The URL to access the Jenkins server"
  value       = format("http://%s:8080", aws_instance.jenkins_server.public_ip)
}

# Output the CloudWatch Log Group ARN for RDS
output "rds_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for RDS"
  value       = aws_cloudwatch_log_group.rds_log_group.arn
}

# Output the CloudWatch Log Group ARN for EMR
output "emr_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for EMR"
  value       = aws_cloudwatch_log_group.emr_log_group.arn
}

# Output the CloudWatch Log Group ARN for Jenkins
output "jenkins_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for Jenkins"
  value       = aws_cloudwatch_log_group.jenkins_log_group.arn
}
