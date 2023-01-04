terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  user           = var.user
  password       = var.password
  vsphere_server = var.vsphere_server

  allow_unverified_ssl = true
}

variable "user" {}
variable "password" {
  sensitive   = true
  type = string
}
variable "vsphere_server" {}
variable "ssh_user" {}

