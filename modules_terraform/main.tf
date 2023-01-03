variable "ssh_user" {
  default = "alexa"
}
variable "ssh_key" {
  default = "/home/alexa/.ssh/id_rsa"
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vmtemp
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

locals {
  ssh_user = var.ssh_user
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.cpu_number
  memory           = var.memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = var.vm_name
        domain    = var.domain_name
      }
      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = var.vm_cidr
      }
      dns_server_list = var.dns_list
      ipv4_gateway = var.default_gw
    }
  }
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.ssh_key)
      host        = self.clone[0].customize[0].network_interface[0].ipv4_address
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook  -i ${self.clone[0].customize[0].network_interface[0].ipv4_address}, --private-key ${var.ssh_key} ../playbook.yml"
  }
}
