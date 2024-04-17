resource "flexibleengine_networking_secgroup_v2" "example_secgroup" {
  name        = "secgroup_1"
  description = "My  security group"
}
resource "flexibleengine_networking_secgroup_rule_v2" "secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = flexibleengine_networking_secgroup_v2.example_secgroup.id
}