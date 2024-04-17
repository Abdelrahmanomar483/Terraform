resource "flexibleengine_vpc_eip" "eip_1" {
  count = 2
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name       = "test"
    size       = 10
    share_type = "PER"
  }
}

output "eip" {
  value = flexibleengine_vpc_eip.eip_1[*].publicip.0.ip_address
}