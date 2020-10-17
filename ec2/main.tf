data "aws_availability_zones" "available" {}

data "aws_ami" "ubuntu" {
  owners      = ["102837901569"]
  most_recent = true
  filter {
    name   = "image-id"
    # values = ["ami-0817d428a6fb68645"]
    values = ["ami-0025cead08302a9d5"]
  }
}

resource "aws_instance" "test-test-instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.rajdeep_public_key
  subnet_id              = var.public_subnet_1

  tags = {
    Name = "test-ec2-instance"
  }
}