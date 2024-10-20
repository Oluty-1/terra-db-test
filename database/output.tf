# database/outputs.tf

output "cluster_endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.aurora.endpoint
}

output "cluster_reader_endpoint" {
  description = "The cluster reader endpoint"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "cluster_id" {
  description = "The ID of the cluster"
  value       = aws_rds_cluster.aurora.id
}

output "security_group_id" {
  description = "The security group ID associated with the RDS cluster"
  value       = aws_security_group.db_sg.id
}
