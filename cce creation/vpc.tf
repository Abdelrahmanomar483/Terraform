resource "flexibleengine_vpc_v1" "cce_vpc" {
  name = "example-vpc"
  cidr = "192.168.0.0/16"
}

resource "flexibleengine_vpc_subnet_v1" "cce_subnet" {
  name       = "example-vpc-subnet"
  cidr       = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
  vpc_id     = flexibleengine_vpc_v1.cce_vpc.id
}

resource "flexibleengine_networking_port_v2" "port_1" {
  name           = "port_1"
  network_id     = flexibleengine_vpc_subnet_v1.cce_subnet.id
  admin_state_up = "true"
}

output "cidr" {
  value = flexibleengine_vpc_subnet_v1.cce_subnet.cidr
}
output "network_id" {
  value = flexibleengine_vpc_subnet_v1.cce_subnet.id
}