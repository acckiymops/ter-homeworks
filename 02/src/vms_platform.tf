###cloud vars

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "subnet name"
}


###ssh vars

#variable "vm_db_vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIu6/zoIMZvTalGlVj7UtkPSyxemWXt9NXb29eNrv38m mvmeles1@ubuntu"
#  description = "ssh-keygen -t ed25519"
#}

variable "vms_ssh_root_key" {
  type = object({
    pub_key = string
  })
  default = {
    pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIu6/zoIMZvTalGlVj7UtkPSyxemWXt9NXb29eNrv38m mvmeles1@ubuntu"
  }
}

#compute vars

variable "project" {
  default = "netology"
}

variable "env" {
  default = "develop-platform"
}

variable "role_web" {
  default = "web"
}

variable "role_db" {
  default = "db"
}

/*
variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}
*/

variable "vm_web_image_id" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_image_id" {
  type    = string
  default = "ubuntu-2004-lts"
}



variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    },
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}
