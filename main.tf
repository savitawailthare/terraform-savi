provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami                         ="ami-0b08bfc6ff7069aff"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "mumbai"
  security_groups             = ["default"]
vpc_security_group_ids  = [aws_security_group.this.id]
  ebs_block_device {
    device_name = "/dev/sdc"
    volume_size = 10
    volume_type = "gp2"

  }

  tags = {
    Name = "tf.demo-instance"
  }
}


resource "aws_security_group" "this" {
  name        = "demo-sg-TF"
   vpc_id      = "vpc-0953655dea4594840"


  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "My first SECOND sg"
  }
}
