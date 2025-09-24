resource "aws_instance" "example" {
 ami = var.ami
 instance_type = var.instance_type
 tags = {
    Name = "myserver"
 }
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
  default     = "-------------------"
}