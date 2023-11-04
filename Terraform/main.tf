#File CORE của Terraform dùng để chạy các module tương tác với VCSA
#xác thực kết nối với VM bằng các biến tự khởi tạo
provider "vsphere" {
  user 			= var.vsphere_user
  password		= var.vsphere_password
  vsphere_server	= var.vsphere_server
  allow_unverified_ssl	= true
}
#gọi các tài nguyên trên VCSA với biến tự khởi tạo
#Tên của Datacenter
data "vsphere_datacenter" "dc" { name = var.vsphere_datacenter}
#tên của các máy chủ ESXI
data "vsphere_host" "hosts" {
  name			= var.vsphere_host
  datacenter_id		= data.vsphere_datacenter.dc.id
}
#tên của các cluster
data "vsphere_compute_cluster" "compute_cluster" {
  name			= var.vsphere_compute_cluster
  datacenter_id		= data.vsphere_datacenter.dc.id
}
#tên của ổ lưu trữ
data "vsphere_datastore" "datastore" {
  name			= var.vsphere_datastore
  datacenter_id         = data.vsphere_datacenter.dc.id
}
#tên của card mạng
data "vsphere_network" "network" {
  name			= var.vsphere_network
  datacenter_id		= data.vsphere_datacenter.dc.id
}
#tên của template sẽ sử dụng để triển khai máy ảo
data "vsphere_virtual_machine" "template" {
  name			= var.vm_template_name
  datacenter_id         = data.vsphere_datacenter.dc.id
}
#tạo các tài nguyên cần thiết cho máy ảo triển khai trên VCSA
resource "vsphere_virtual_machine" "vm" {
  #với mỗi vòng lặp var.vms sẽ tạo 1 máy ảo tương ứng
  for_each 		= var.vms
  #khai báo các tài nguyên mà máy ảo sử dụng 
  datastore_id		= data.vsphere_datastore.datastore.id
  resource_pool_id	= data.vsphere_compute_cluster.compute_cluster.resource_pool_id
  guest_id		= var.vm_guest_id
  #khai báo card mạng cho máy ảo
  network_interface {
    network_id 		= data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  #khai báo tên, CPU,memory
  name          = each.value.name
  num_cpus 		= each.value.vcpu
  memory		= each.value.memory
  firmware		= var.vm_firmware 
  #khai báo ổ cứng
  dynamic "disk" {
    for_each = var.disks
    content {
      label            = disk.value.label
      size             = disk.value.size
      thin_provisioned = disk.value.thin_provisioned
      unit_number      = disk.value.unit_number
    }
  }
  #clone của template và truyền các tham số vào như máy ảo ổ đĩa 
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
    dns_server_list = each.value.DNS
   }
  }
  extra_config = {
    user_data = file("${path.module}/userdata.yml")
    "guestinfo.userdata"          = base64encode(file("${path.module}/userdata.yml"))
    "guestinfo.userdata.encoding" = "base64"
  }
}

#resource "vsphere_virtual_machine_snapshot" "snapshot" {
#  virtual_machine_uuid = vsphere_virtual_machine.vm[*].uuid
#  snapshot_name        = "snapshot"
#  description          = "Snapshot description"
#  memory               = true
#  quiesce              = true
#}

