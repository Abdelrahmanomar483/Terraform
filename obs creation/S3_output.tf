output "OBS_name" {
  value = flexibleengine_obs_bucket.bucket.id
}

output "OBS_domain" {
  value = flexibleengine_obs_bucket.bucket.bucket_domain_name
}