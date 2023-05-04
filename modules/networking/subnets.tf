resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name      = "public-subnet-${count.index + 1}"
    Terraform = "true"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnets_cidr[count.index]

  tags = {
    Name      = "private-subnet-${count.index + 1}"
    Terraform = "true"
  }
}
