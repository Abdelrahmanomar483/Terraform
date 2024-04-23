resource "flexibleengine_obs_bucket_policy" "policy" {
  bucket = flexibleengine_obs_bucket.bucket.id
  policy = <<POLICY
{
    "Statement": [
        {
            "Sid": "Public Read and Write-8dfb",
            "Effect": "Allow",
            "Principal": {
                "ID": [
                    "*"
                ]
            },
            "Action": [
                "ListBucket",
                "GetBucketLocation",
                "ListBucketVersions",
                "ListBucketMultipartUploads",
                "GetObject",
                "PutObject",
                "RestoreObject",
                "GetObjectAcl",
                "PutObjectAcl",
                "GetObjectVersion",
                "GetObjectVersionAcl",
                "AbortMultipartUpload",
                "ListMultipartUploadParts",
                "ModifyObjectMetaData"
            ],
            "Resource": [
                "my-bucket-omar",
                "my-bucket-omar/*"
            ]
        }
    ]
}
POLICY
}