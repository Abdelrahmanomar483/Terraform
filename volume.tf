resource "flexibleengine_blockstorage_volume_v2" "myvol" {
  name  = "myvol.${count.index}"
  size  = 20
  count = 2
}
output "volume_name" {
  value = flexibleengine_blockstorage_volume_v2.myvol[*].name
}