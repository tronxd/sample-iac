resource aws_s3_bucket "mytestbucket" {
  bucket = "mytestbucket"
  versioning {
    enabled = true
  }
}

resource aws_s3_bucket_policy "bucket_policy" {
  bucket = aws_s3_bucket.mytestbucket.bucket
  policy = <<EOF
{
  "statement": [
    {
      "Sid": "DenyUnsecureTransport",
      "Action": "s3:*",
      "Effect": "Deny",
      "Resource": [
        ${aws_s3_bucket.mytestbucket.arn},
        "${aws_s3_bucket.mytestbucket.arn}/*"
      ],
      "Principal": "*",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
EOF
}
