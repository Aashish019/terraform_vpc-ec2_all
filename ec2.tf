#ec2 instance public
resource "aws_instance" "aj_instance_pub" {
  ami           = "ami-0ba9883b710b05ac6"
  instance_type = "t2.micro"
  key_name      = "next"
  tags = {
    Name = "newinstancePub"
  }
  vpc_security_group_ids = [aws_security_group.aj_sg.id]
  subnet_id              = aws_subnet.pub_subnet.id
}

#ec2 instance private
resource "aws_instance" "aj_instance_pvt" {
  ami           = "ami-0ba9883b710b05ac6"
  instance_type = "t2.micro"
  key_name      = "next"
  tags = {
    Name = "newinstancePvt"
  }
  vpc_security_group_ids = [aws_security_group.aj_sg.id]
  subnet_id              = aws_subnet.pvt_subnet.id
}
