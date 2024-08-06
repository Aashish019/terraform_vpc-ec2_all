#ec2 instance public
resource "aws_instance" "aj_instance_pub" {
  ami                    = var.ami_name
  instance_type          = var.ec2_type
  key_name               = var.ec2_key_name
  tags                   = var.ec2_tag_name_1
  vpc_security_group_ids = [aws_security_group.aj_sg.id]
  subnet_id              = aws_subnet.pub_subnet.id
}

#ec2 instance private
resource "aws_instance" "aj_instance_pvt" {
  ami                    = var.ami_name
  instance_type          = var.ec2_type
  key_name               = var.ec2_key_name
  tags                   = var.ec2_tag_name_2
  vpc_security_group_ids = [aws_security_group.aj_sg.id]
  subnet_id              = aws_subnet.pvt_subnet.id
}
