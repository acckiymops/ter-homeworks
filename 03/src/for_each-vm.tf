variable "vm_db" {
  type = map(object(
    {
      cpu           = number
      ram           = number
      core_fraction = number
      disk_size     = number
      disk_type     = string
      preemptible   = bool
      nat           = bool
      serial_port   = bool
  }))
  default = {
    "main" = {
      cpu           = 2
      ram           = 2
      core_fraction = 50
      disk_size     = 10
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true
      serial_port   = true
    }
    "replica" = {
      cpu           = 2
      ram           = 1
      core_fraction = 20
      disk_size     = 10
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true
      serial_port   = false
    }
  }
}

resource "yandex_compute_instance" "db" {
  for_each    = var.vm_db
  name        = each.key
  platform_id = "standard-v3"
  zone        = var.default_zone
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_size
      type     = each.value.disk_type
    }
  }
  scheduling_policy {
    preemptible = each.value.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
  }
  metadata = {
    serial-port-enable = each.value.serial_port
    ssh-keys           = "ubuntu:${local.vm_pub_key}"
  }
}
