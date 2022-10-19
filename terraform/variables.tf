variable "username" {
  description = "vSphere username"
  type        = string
  #sensitive   = true
}

variable "password" {
  description = "vSphere password"
  type        = string
  #sensitive   = true
}

variable "vm_name" {
  type = list
  default = ["host1", "db1"]
}

variable "vm_pubic_ip" {
  type = list
  default = ["192.168.11.51", "192.168.11.53"]
}

variable "vhost" {
  description = "vSphere server"
  type        = string
  default     = "esxi7.jad.local"
}

variable "dc" {
  description = "vSphere data center"
  type        = string
  default     = "Datacenter"
}

variable "store" {
  description = "vSphere datastore"
  type        = string
  default     = "datastore1"
}

variable "net" {
  description = "vSphere network name"
  type        = string
  default     = "VM Network"
}

variable "tpl_name" {
  description = "The template apply to creating vm"
  type        = string
  default     = "tpl01"
}

variable "path" {
  description = "Which Datacenter folder vm create"
  type        = string
  default     = "vms"
}

variable "domain" {
  description = "Domain name"
  type        = string
  default     = "jad.local"
}