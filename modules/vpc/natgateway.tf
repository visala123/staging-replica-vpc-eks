### Nat Gateway for Private Instances ###

resource "aws_eip" "eip_nat" {
  

  tags = {
    Name = "stage-eks-cluster-eip-us-east-1a"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public-webtier-subnet-1.id

  tags = {
    "Name" = "stage-eks-cluster-nat-public1-us-east-1a"
  }
}