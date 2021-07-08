resource aws_s3_bucket_public_access_block "public_access_block" {
  bucket = aws_s3_bucket.mytestbucket2.bucket
  block_public_acls = true
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource aws_s3_bucket "mytestbucket2" {
  bucket = "mytestbucket2"
  acl    = "public-read"
}