resource "aws_s3_bucket" "odi-tf-state-bucket" {
  bucket = "odi-tf-state-bucket"
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.odi-tf-state-bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "odi-tf-state-bucket-versioning" {
  bucket = aws_s3_bucket.odi-tf-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_kms_key" "odi-tf-state-bucket-key" {
  description = "This key is used to encrypt bucket objects"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "odi-tf-state-bucket-encryption" {
  bucket = aws_s3_bucket.odi-tf-state-bucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.odi-tf-state-bucket-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
resource "aws_s3_bucket_public_access_block" "odi-tf-state-bucket" {
  bucket                  = aws_s3_bucket.odi-tf-state-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}