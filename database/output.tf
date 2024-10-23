output "rds_endpoint" {
  description = "The RDS endpoint"
  value       = aws_rds_cluster.main.endpoint
}

output "rds_reader_endpoint" {
  description = "The RDS reader endpoint"
  value       = aws_rds_cluster.main.reader_endpoint
}

output "rds_port" {
  description = "The RDS port"
  value       = aws_rds_cluster.main.port
}