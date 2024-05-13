resource "flexibleengine_cce_cluster_v3" "cluster_1" {
  name                   = "cluster"
  cluster_type           = "VirtualMachine"
  authentication_mode    = "rbac"
  description            = "new cluster"
  flavor_id              = "cce.s1.small"
  vpc_id                 = flexibleengine_vpc_v1.cce_vpc.id
  subnet_id              = flexibleengine_vpc_subnet_v1.cce_subnet.id
  container_network_type = "overlay_l2"
}