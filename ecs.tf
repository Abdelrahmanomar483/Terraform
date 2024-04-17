resource "flexibleengine_compute_instance_v2" "basic" {
  name            = "basic.${count.index}"
  image_id        = "8c691ac0-3a54-4d0e-9fc5-041570435c5f"
  count           = 2
  flavor_id       = data.flexibleengine_compute_flavors_v2.flavors.flavors[2]
  key_pair        = "my-keypair"
  security_groups = ["default"]

  network {
    uuid = flexibleengine_vpc_subnet_v1.example_subnet.id
  }

  tags = local.common_tags
}
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  common_tags = {
    Owner   = "DevOps Team"
    service = "backend"
  }
}


resource "flexibleengine_compute_floatingip_associate_v2" "myip0" {
  floating_ip = flexibleengine_vpc_eip.eip_1[0].publicip.0.ip_address
  instance_id = flexibleengine_compute_instance_v2.basic[0].id
  ##fixed_ip    = flexibleengine_compute_instance_v2.basic.network.1.fixed_ip_v4
}

resource "flexibleengine_compute_volume_attach_v2" "attached0" {
  instance_id = flexibleengine_compute_instance_v2.basic[0].id
  volume_id   = flexibleengine_blockstorage_volume_v2.myvol[0].id
}


resource "flexibleengine_compute_floatingip_associate_v2" "myip1" {
  floating_ip = flexibleengine_vpc_eip.eip_1[1].publicip.0.ip_address
  instance_id = flexibleengine_compute_instance_v2.basic[1].id
  ##fixed_ip    = flexibleengine_compute_instance_v2.basic.network.1.fixed_ip_v4
}

resource "flexibleengine_compute_volume_attach_v2" "attached1" {
  instance_id = flexibleengine_compute_instance_v2.basic[1].id
  volume_id   = flexibleengine_blockstorage_volume_v2.myvol[1].id
}

output "ECS_name" {
  value = flexibleengine_compute_instance_v2.basic[*].name
}

output "timestamp" {
  value = local.time
}