data "flexibleengine_compute_flavors_v2" "flavors" {
  availability_zone = "eu-west-0a"
  cpu_core          = 2
  memory_size       = 4
}

output "flavor" {
  value = data.flexibleengine_compute_flavors_v2.flavors.flavors[*]
}