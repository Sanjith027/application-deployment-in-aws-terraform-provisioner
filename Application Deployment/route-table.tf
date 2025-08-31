resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id   # This route table belongs to your VPC

  route {
    cidr_block = "0.0.0.0/0"  # Match ALL IPv4 traffic (the internet)
    gateway_id = aws_internet_gateway.igw.id  # Send it to Internet Gateway
  }
}
