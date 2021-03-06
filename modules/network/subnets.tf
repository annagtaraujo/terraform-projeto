resource "aws_subnet" "vpc-private-subnet" {
  for_each = {
    for config in local.private_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc-public-subnet" {
  for_each = {
    for config in local.public_subnets :
      config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
}

resource "aws_subnet" "vpc-database-subnet" {
  for_each = {
    for config in local.database_subnets :
    config.cidr_block => config
  }
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  tags              = each.value["tags"]
}


