resource "yandex_compute_disk" "storage_disk" {
  count = 3
  name  = "disk_for_storage_${count.index + 1}"
  type  = "network-hdd"
  size  = 1
  zone  = var.default_zone
}

resource "yandex_compute_instance" "vm_storage" {
  name        = "storage"
  hostname    = "vmstorage"
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 0
    ssh-keys           = "ubuntu:${local.vm_pub_key}"
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk[*]
    content {
      disk_id     = secondary_disk.value.id
      auto_delete = true
    }
  }
}
