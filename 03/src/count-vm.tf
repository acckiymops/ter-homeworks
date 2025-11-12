data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_id
}

variable "vm_web_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

resource "yandex_compute_instance" "web" {
  count       = 2
  name        = "web-${count.index + 1}"
  platform_id = "standard-v3"
  zone        = var.default_zone
  depends_on  = [yandex_compute_instance.db]
  resources {
    cores         = var.vm_web_resources.web.cores
    memory        = var.vm_web_resources.web.memory
    core_fraction = var.vm_web_resources.web.core_fraction
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vm_web_ssh_root_key.pub_key}"
  }
}
