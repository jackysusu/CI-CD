terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  # Configuration options
  user           = "${var.username}@${var.domain}"
  password       = "${var.password}"
  vsphere_server = "192.168.11.7"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}