resource "aws_launch_template" "ter_asg" {
  name_prefix   = "ter_asg"
  image_id      = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2
}

resource "aws_launch_template" "asg" {
  # configuration for launch template
  launch_template {
    id      = aws_launch_template.asg.id
    version = "$Latest"
  }

  tag {
    key   = "Name"
    value = ".pem"

    propagate_at_launch = true
  }
}

# Create launch configuration
resource "aws_launch_configuration" "luit-asg" {
  name            = "my-luit-asg"
  image_id        = "ami-0230bd60aa48260c6" # Set your desired AMI ID
  instance_type   = "t2.micro"              # Set your desired instance type
  key_name        = "luitprojectkey"
  security_groups = [aws_security_group.luit_sg.id]
  user_data       = filebase64("${path.root}/install.apache.sh")
}
