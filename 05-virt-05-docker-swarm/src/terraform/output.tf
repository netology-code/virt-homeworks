output "internal_ip_address_node01" {
  value = "${yandex_compute_instance.node01.network_interface.0.ip_address}"
}

output "external_ip_address_node01" {
  value = "${yandex_compute_instance.node01.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node02" {
  value = "${yandex_compute_instance.node02.network_interface.0.ip_address}"
}

output "external_ip_address_node02" {
  value = "${yandex_compute_instance.node02.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node03" {
  value = "${yandex_compute_instance.node03.network_interface.0.ip_address}"
}

output "external_ip_address_node03" {
  value = "${yandex_compute_instance.node03.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node04" {
  value = "${yandex_compute_instance.node04.network_interface.0.ip_address}"
}

output "external_ip_address_node04" {
  value = "${yandex_compute_instance.node04.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node05" {
  value = "${yandex_compute_instance.node05.network_interface.0.ip_address}"
}

output "external_ip_address_node05" {
  value = "${yandex_compute_instance.node05.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_node06" {
  value = "${yandex_compute_instance.node06.network_interface.0.ip_address}"
}

output "external_ip_address_node06" {
  value = "${yandex_compute_instance.node06.network_interface.0.nat_ip_address}"
}
