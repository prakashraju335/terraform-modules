resource "aws_instance" "srpr_main" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone

  tags = merge(
    {
      Name = var.instance_name
    },
    var.tags
  )
}
