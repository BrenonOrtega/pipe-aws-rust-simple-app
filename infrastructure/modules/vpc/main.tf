resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "default_private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = aws_vpc.main_vpc.cidr_block
  availability_zone = vars.region
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.default_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}