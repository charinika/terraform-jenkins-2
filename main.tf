
# Create Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "custom_ec2" {
  ami           = "ami-088aa3f9eb220970d"
  instance_type = "t2.micro"
  key_name      = "charukey"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Terraform-AMI-Instance"
  }
}
