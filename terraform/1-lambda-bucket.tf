#hashicorp provided this enticing The resource random_pet generates random pet names that are intended to be used as unique identifiers for other resources
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
# dont like using pet name ? - instead you can use random id included here for ref

resource "random_pet" "lambda_bucket_name" {
  prefix = "lambda"
  length = 2
}


resource "random_id" "lambda_bucket_id" {
  prefix = "lambda"
  byte_length = 8
}

resource "aws_s3_bucket" "lambda_bucket" {
  
  bucket        = lower(random_id.lambda_bucket_id.id)
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
