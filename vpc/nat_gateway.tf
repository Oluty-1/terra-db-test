# vpc/nat_gateway.tf

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-eip"
  }
}

resource "aws_nat_gateway" "vtest-nat" {
#  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.vtest-public-1.id

  tags = {
    Name        = "${var.project_name}-nat"
  }

  depends_on = [aws_internet_gateway.vtest-IGW]
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.vtest-public-RT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vtest-nat.id
}
