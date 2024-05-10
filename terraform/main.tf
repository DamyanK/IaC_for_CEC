
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}


resource "esxi_guest" "vmtest01" {
  guest_name = "ubuntu_1"
  disk_store = var.disk_store
  network_interfaces {
    virtual_network = var.virtual_network
  }

  ovf_source = var.ovf_file_ubuntu

  ovf_properties {
    key   = "user-data"
    value = base64encode(data.template_file.cloud-userdata.rendered)
  }

  guestinfo = {
    "metadata.encoding" = "gzip+base64"
    "metadata"          = base64gzip(data.template_file.cloud-metadata.rendered)
    "userdata.encoding" = "gzip+base64"
    "userdata"          = base64gzip(data.template_file.cloud-userdata.rendered)
  }
}

data "template_file" "cloud-metadata" {
  template = file("metadata.tpl")
  vars = {
    ipAddress  = var.vmIP
    gateway    = var.vmGateway
    nameserver = var.nameserver
  }
}

data "template_file" "cloud-userdata" {
  template = file("userdata.tpl")
}

output "ip" {
  value = [esxi_guest.vmtest01.ip_address]
}
