provider "aws" {
  
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_iam_user" "lb-terra" {
  name = "user-aws"
 

  tags = {
    name= "devop"
    environment= "terra-op"
  }
}