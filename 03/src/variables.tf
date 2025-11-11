###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_image_id" {
  type    = string
  default = "ubuntu-2404-lts"
}

############################## vm_vars ##############################
variable "vm_web_ssh_root_key" {
  type = object({
    pub_key = string
  })
  default = {
    pub_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIu6/zoIMZvTalGlVj7UtkPSyxemWXt9NXb29eNrv38m mvmeles1@ubuntu"
  }
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
    },
  }
}


#########################################################################
