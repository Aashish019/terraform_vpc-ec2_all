#security group
resource "aws_security_group" "aj_sg" {
  name   = "Aj SecurityG"
  vpc_id = aws_vpc.aj_vpc.id
  ingress {
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    to_port     = 0
    from_port   = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
