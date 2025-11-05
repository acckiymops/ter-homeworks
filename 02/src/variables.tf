###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  #  default     = "b1g8urmvu327cc7r2ll9"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  #  default     = "b1gehc6pt4n63rt6c6hj"
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
  description = "VPC network & subnet name"
}


###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIu6/zoIMZvTalGlVj7UtkPSyxemWXt9NXb29eNrv38m mvmeles1@ubuntu"
  description = "ssh-keygen -t ed25519"
}
*/

variable "test" {
  type = list(
    map(
      list(string)
    )
  )
  description = "SSH connection string and internal IP addresses"
}
