resource "aws_subnet" "public-webtier-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public-webtier-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "stage-eks-cluster-subnet-public1-us-east-1a"
  }
}

###  public Subnet 2 - Webtier  ###

resource "aws_subnet" "public-webtier-subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public-webtier-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "stage-eks-cluster-subnet-public2-us-east-1b"
  }
}

###  Private Subnet 1 - Apptier  ###

resource "aws_subnet" "private-apptier-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private-apptier-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "stage-eks-cluster-subnet-private1-us-east-1"
  }
}

###  Private Subnet 2 - Apptier  ###


resource "aws_subnet" "private-apptier-subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private-apptier-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "stage-eks-cluster-subnet-private2-us-east-1b"
  }
}


###  Private Subnet-db 1 ###

resource "aws_subnet" "private-database-subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private-database-subnet-1-cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "stage-eks-cluster-subnet-private3-us-east-1a"
  }
}


###  Private Subnet-db 2  ###


resource "aws_subnet" "private-database-subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private-database-subnet-2-cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "stage-eks-cluster-subnet-private4-us-east-1b"
  }
}