#Hạ Tầng Tài Nguyên
vsphere_user = "administrator@vcbs.com"
vsphere_server = "192.168.41.134"
vsphere_datacenter = "VCBS"
vsphere_compute_cluster = "HO"
vsphere_host = "192.168.41.133"
vsphere_datastore = "datastore1"
vsphere_network = "VM Network"
#Cấu Hình chung máy ảo
vm_template_name = "UbuntuTemplate"
vm_guest_id = "ubuntu64Guest"
vm_ipv4_netmask	 = 24
vm_ipv4_gateway	 = "192.168.41.2"
vm_dns_servers = ["8.8.8.8", "8.8.4.4"]
vm_domain	= ""
vm_firmware = "efi"
#template máy ảo, clone để ra nhiều máy
vms = {
  PC1={name="Ubuntu41-152",vcpu=2,memory=2048,vm_ip="192.168.41.152"}
  PC2={name="Ubuntu41-153",vcpu=1,memory=1024,vm_ip="192.168.41.153"}
}