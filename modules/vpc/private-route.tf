resource "aws_route_table" "private-route-table1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  /*route {
    cidr_block     = "10.40.0.0/18"
    nat_gateway_id = local
  }*/

  tags = {
    Name = "stage-eks-cluster-rtb-private1-us-east-1a"
  }
}
resource "aws_route_table" "private-route-table2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  /*route {
    cidr_block     = "10.40.0.0/18"
    nat_gateway_id = local
  }*/

  tags = {
    Name = "stage-eks-cluster-rtb-private2-us-east-1b"
  }
}
resource "aws_route_table" "private-route-table3" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  /*route {
    cidr_block     = "10.40.0.0/18"
    nat_gateway_id = local
  }*/

  tags = {
    Name = "stage-eks-cluster-rtb-private3-us-east-1a"
  }
}
resource "aws_route_table" "private-route-table4" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  /*route {
    cidr_block     = "10.40.0.0/18"
    nat_gateway_id = local
  }*/

  tags = {
    Name = "stage-eks-cluster-rtb-private4-us-east-1b"
  }
}

resource "aws_route_table_association" "nat_route_1" {
  subnet_id      = aws_subnet.private-apptier-subnet-1.id
  route_table_id = aws_route_table.private-route-table1.id
}
resource "aws_route_table_association" "nat_route_2" {
  subnet_id      = aws_subnet.private-apptier-subnet-2.id
  route_table_id = aws_route_table.private-route-table2.id
}
resource "aws_route_table_association" "nat_route_3" {
  subnet_id      = aws_subnet.private-database-subnet-1.id
  route_table_id = aws_route_table.private-route-table3.id
}
resource "aws_route_table_association" "nat_route_4" {
  subnet_id      = aws_subnet.private-database-subnet-2.id
  route_table_id = aws_route_table.private-route-table4.id
}