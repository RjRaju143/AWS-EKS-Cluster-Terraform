resource "aws_vpc" "main" {
  # cidr_block = "10.0.0.0/16" #
  cidr_block = var.vpc_cidr #

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_subnet" "private_zone1" {
  vpc_id = aws_vpc.main.id
  # cidr_block        = "10.0.0.0/19"
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.private_zone1

  tags = {
    "Name"                                      = "${var.private_zone1}-private-${var.private_zone1}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id = aws_vpc.main.id
  # cidr_block        = "10.0.32.0/19"
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.private_zone2

  tags = {
    "Name"                                      = "${var.private_zone2}-private-${var.private_zone2}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id = aws_vpc.main.id
  # cidr_block              = "10.0.64.0/19"
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.public_zone1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "${var.cluster_name}-public-${var.public_zone1}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public_zone2" {
  vpc_id = aws_vpc.main.id
  # cidr_block              = "10.0.96.0/19"
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.public_zone2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "${var.cluster_name}-public-${var.public_zone2}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.name}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_zone1.id

  tags = {
    Name = "${var.name}-nat"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    # cidr_block     = "0.0.0.0/0"
    cidr_block     = var.nat_cidr
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.name}-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    # cidr_block = "0.0.0.0/0"
    cidr_block = var.igw_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_route_table_association" "private_zone1" {
  subnet_id      = aws_subnet.private_zone1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_zone2" {
  subnet_id      = aws_subnet.private_zone2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_zone1" {
  subnet_id      = aws_subnet.public_zone1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_zone2" {
  subnet_id      = aws_subnet.public_zone2.id
  route_table_id = aws_route_table.public.id
}

