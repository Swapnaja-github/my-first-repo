data "aws_vpc" "selected" {
  tags = {
    Name = "default-vpc"
  }
}

data "aws_subnet" "select" {
  id = "subnet-0fb109bf4f659507f"
}

data "aws_key_pair" "ironhack_key" {
  key_name = "ironhack-key"
}

data "aws_security_group" "security" {
  #id = "sg-0b9dfd187704cb7d3"
  id = "sg-048a186f7c3af05f6"
}

# 1. Use an existing security group (instead of auto-assigning)
# 2. Create at least 4 variables for this file
# 3. Create 2 other instances with the same configurations (but different names)

resource "aws_instance" "web_server" {
  ami                         = var.ami_image_name
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.select.id

  key_name = data.aws_key_pair.ironhack_key.key_name

  tags = {
    Name = "MyWebServer"
  }
}

resource "aws_instance" "web_server1" {
  ami                         = var.ami_image_name
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.select.id
  vpc_security_group_ids      = [data.aws_security_group.security.id]
  key_name                    = data.aws_key_pair.ironhack_key.key_name

  tags = {
    Name = "MyWebServer1"
  }
}
resource "aws_instance" "web_server2" {
  ami                         = var.ami_image_name
  instance_type               = var.instance_type
  associate_public_ip_address = true
  #subnet_id                  = data.aws_subnet.select.id
  subnet_id                   = var.aws_subnet
  key_name = data.aws_key_pair.ironhack_key.key_name

  tags = {
    Name = "MyWebServer2"
  }
}