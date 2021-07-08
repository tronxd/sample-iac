resource aws_s3_bucket_public_access_block "public_access_block" {
  bucket = aws_s3_bucket.mytestbucket.bucket
}

resource aws_sns_topic "topic" {
  name = "test-topic"
}