provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "0b08bfc6ff7069aff"
  instance_type = "t2.micro"
  associate_public_ip_address ="true"
  key_name ="key-myname"
  security_group = ["default"]
  ebc_block_device{
     device_name = "/dev/sdc"
 volume_size = 10
 volume_type="gp2"
  }

  tags = {
    Name = "tf.demo-instance"
  }
}