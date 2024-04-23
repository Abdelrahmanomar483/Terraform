resource "flexibleengine_obs_bucket" "bucket" {
  bucket     = "my-bucket-omar"
  acl        = "private"
  versioning = true

  lifecycle_rule {
    name    = "log"
    prefix  = "log/"
    enabled = true

    expiration {
      days = 365
    }
    transition {
      days          = 60
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 180
      storage_class = "GLACIER"
    }
  }

  lifecycle_rule {
    name    = "tmp"
    prefix  = "tmp/"
    enabled = true

    noncurrent_version_expiration {
      days = 180
    }
    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}