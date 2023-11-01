provider "vsphere" {
  user 			= var.vsphere_user
  password		= var.vsphere_password
  vsphere_server	= var.vsphere_server
  allow_unverified_ssl	= true
}
data "vsphere_datacenter" "dc" { name = var.vsphere_datacenter}
data "vsphere_host" "hosts" {
  name			= var.vsphere_host
  datacenter_id		= data.vsphere_datacenter.dc.id
}
data "vsphere_compute_cluster" "compute_cluster" {
  name			= var.vsphere_compute_cluster
  datacenter_id		= data.vsphere_datacenter.dc.id
}
data "vsphere_datastore" "datastore" {
  name			= var.vsphere_datastore
  datacenter_id         = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
  name			= var.vsphere_network
  datacenter_id		= data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template" {
  name			= var.vm_template_name
  datacenter_id         = data.vsphere_datacenter.dc.id
}
resource "vsphere_virtual_machine" "vm" {
  for_each 		= var.vms
  datastore_id		= data.vsphere_datastore.datastore.id
  resource_pool_id	= data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  guest_id		= var.vm_guest_id
  network_interface {
    network_id 		= data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  name          = each.value.name
  num_cpus 		= each.value.vcpu
  memory		= each.value.memory
  firmware		= var.vm_firmware 
  dynamic "disk" {
    for_each = var.disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      thin_provisioned = disk.value.thin_provisioned
      unit_number      = disk.value.unit_number
    }
  }
  clone {
    template_uuid       = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.value.name
        domain		= var.vm_domain
    }
    network_interface {
      ipv4_address	= each.value.vm_ip
      ipv4_netmask	= var.vm_ipv4_netmask
    }
    ipv4_gateway = var.vm_ipv4_gateway
    dns_server_list = var.vm_dns_servers
   }
  }
  extra_config = {
    user_data = file("${path.module}/userdata.yml")
    "guestinfo.userdata"          = base64encode(file("${path.module}/userdata.yml"))
    "guestinfo.userdata.encoding" = "base64"
  }
}



