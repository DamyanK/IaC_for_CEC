
variable "esxi_hostname" {
  default = ""
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_username" {
  default = ""
}

variable "esxi_password" {
  default = ""
}

variable "virtual_network" {
  default = "VM Network"
}

variable "disk_store" {
  default = "datastore1"
}

variable "ovf_file_ubuntu" {
  default = ""
}

variable "vmIP" {
  default = ""
}

variable "vmGateway" {
  default = ""
}

variable "nameserver" {
  default = "8.8.8.8"
}
