# Create security group
resource "aws_security_group" "luit_sg" {
  name        = "security group for ASG"
  description = "Allow inbound traffic for web servers"
  vpc_id      = "vpc-02140885f88d8e156"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

# Create launch configuration
resource "aws_launch_configuration" "luit_lc" {
  name          = "luit_lc"
  image_id      = "ami-0230bd60aa48260c6" # Set your desired AMI ID
  instance_type = "t2.micro"              # Set your desired instance type

  lifecycle {
    create_before_destroy = true
  }
}  
