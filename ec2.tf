resource "awsprops" {
    instance_type =var.instance_type
    key_name = "mumbai"
     vpc_security_group_ids      = ["default"]
     tags = {
    Name = "var.name"
      }

    
  }
