resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      web        = yandex_compute_instance.web
      db         = yandex_compute_instance.db
      vm_storage = yandex_compute_instance.vm_storage[*]
    }
  )
  filename = "${abspath(path.module)}/hosts.ini"

  depends_on = [
    yandex_compute_instance.web,
    yandex_compute_instance.db,
    yandex_compute_instance.vm_storage
  ]
}
