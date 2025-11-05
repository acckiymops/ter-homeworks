locals {
  vm_web_name = "${var.project}-${var.env}-${var.role_web}"
  vm_db_name  = "${var.project}-${var.env}-${var.role_db}"
}

