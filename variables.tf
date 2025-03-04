variable "ami_image_name" {
  type    = string
  default = "ami-0cb91c7de36eed2cb"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "base_region" {
  type    = string
  default = "us-east-2"
}
variable "aws_subnet" {
  type = string
  default = "subnet-0aeced5f6d7f90d87"
}

