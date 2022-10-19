data "vsphere_datacenter" "dc" {
  name          = "${var.dc}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.store}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  name          = "${var.vhost}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "public" {
  name          = "${var.net}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.tpl_name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

### Creat VM from Template ###
resource "vsphere_virtual_machine" "vm" {
  count            = length(var.vm_name)
  name             = element(var.vm_name, count.index)
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 512
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  folder           = "${var.path}"

  network_interface {
    network_id   = data.vsphere_network.public.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = element(var.vm_name, count.index)
        domain    = "${var.domain}"
      }
      
      network_interface {
        ipv4_address = element(var.vm_pubic_ip, count.index)
        ipv4_netmask = 24
      }

      # dns_server_list = ["192.168.11.2", "168.95.1.1"]
      ipv4_gateway = "192.168.11.1"
    }
  }

  ### vSphere edit old resolve.conf, so change link to this old configure ###
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo ln -s -f /run/systemd/resolve/resolv.conf /etc/resolv.conf",
  #     "sudo systemctl daemon-reload && sudo systemctl restart systemd-resolved.service"
  #   ]

  #   connection {
  #     type     = "ssh"
  #     user     = "${var.username}"
  #     password = "${var.password}"
  #     host     = self.default_ip_address
  #     timeout     = "1m"
  #   }
  # }
}
