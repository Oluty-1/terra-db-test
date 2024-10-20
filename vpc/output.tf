# vpc/outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vtest.id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = [aws_subnet.vtest-public-1.id, aws_subnet.vtest-public-2.id]
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = [aws_subnet.vtest-private-1.id, aws_subnet.vtest-private-2.id]
}

output "nat_gateway_ids" {
  description = "List of IDs of NAT Gateways"
  value       = aws_nat_gateway.vtest-nat[*].id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.vtest-public-RT.id
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = aws_route_table.vtest-private-RT.id
}
