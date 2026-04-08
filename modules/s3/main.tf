resource "aws_s3_bucket" "srpr_main" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_s3_bucket_versioning" "srpr_main" {
  bucket = aws_s3_bucket.srpr_main.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_acl" "srpr_main" {
  bucket = aws_s3_bucket.srpr_main.id
  acl    = var.acl
}
