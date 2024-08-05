
# vpc server
resource "aws_vpc" "aj_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "AJ_VPC",
  }

}

#public subnet
resource "aws_subnet" "pub_subnet" {
  vpc_id                  = aws_vpc.aj_vpc.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  tags = {
    Name = "AJ_Subnet_Public"
  }
}

#private subnet
resource "aws_subnet" "pvt_subnet" {
  vpc_id                  = aws_vpc.aj_vpc.id
  cidr_block              = "10.0.0.128/25"
  map_public_ip_on_launch = false
  tags = {
    Name = "AJ_Subnet_Private"
  }
}


#public route table
resource "aws_route_table" "aj_route_table_pub" {
  vpc_id = aws_vpc.aj_vpc.id
  tags = {
    Name = "Pub Route"
  }
}

#private route table
resource "aws_route_table" "aj_route_table_pvt" {
  vpc_id = aws_vpc.aj_vpc.id
  tags = {
    Name = "Pvt Route"
  }
}


#public rt association
resource "aws_route_table_association" "pub_rt" {
  route_table_id = aws_route_table.aj_route_table_pub.id
  subnet_id      = aws_subnet.pub_subnet.id
}

#private rt association
resource "aws_route_table_association" "pvt_rt" {
  route_table_id = aws_route_table.aj_route_table_pvt.id
  subnet_id      = aws_subnet.pvt_subnet.id
}

#internet gateway
resource "aws_internet_gateway" "aj_igw" {
  vpc_id = aws_vpc.aj_vpc.id
  tags = {
    Name = "aj igw"
  }
}

#pub route rule
resource "aws_route" "aj_route_pub" {
  route_table_id         = aws_route_table.aj_route_table_pub.id
  gateway_id             = aws_internet_gateway.aj_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

#pvt route rule
resource "aws_route" "aj_route_pvt" {
  route_table_id = aws_route_table.aj_route_table_pvt.id
  # gateway_id             = aws_nat_gateway.aj_nategateway.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.aj_nategateway.id
}

#elastic ip
resource "aws_eip" "aj_eip" {
  domain = "vpc"
}

#natgateway
resource "aws_nat_gateway" "aj_nategateway" {
  depends_on    = [aws_eip.aj_eip]
  allocation_id = aws_eip.aj_eip.id
  subnet_id     = aws_subnet.pub_subnet.id

}
