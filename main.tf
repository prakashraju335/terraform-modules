module "ec2" {
  source = "./modules/ec2"

  instance_name     = var.ec2_instance_name
  instance_type     = var.ec2_instance_type
  ami               = var.ec2_ami
  availability_zone = var.ec2_availability_zone

  tags = var.common_tags
}

module "s3" {
  source = "./modules/s3"

  bucket_name         = var.s3_bucket_name
  environment         = var.environment
  versioning_enabled  = var.s3_versioning_enabled
  acl                 = var.s3_acl

  tags = var.common_tags
}
