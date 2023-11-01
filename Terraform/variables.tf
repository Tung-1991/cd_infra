variable "vsphere_user" { 
  default = "administrator@vcbs.com"
  type = string
}
variable "vsphere_password" {
  type = string
  default = "Tung1999!"
  sensitive = true
}
variable "vsphere_server" {
  default = "192.168.41.134"
  type = string
}
# Infrastructure - vCenter / vSPhere environment
variable "vsphere_datacenter" {
  default = "VCBS"
  type = string
}
variable "vsphere_host" {
  default = "192.168.41.133"
  type = string
}

variable "vsphere_compute_cluster" { 
  default = "HO"
  type = string
}
variable "vsphere_datastore" {
  default = "datastore1"
  type = string
}
variable "vsphere_network" {
  default = "VM Network"
  type = string
}
#VM
variable "vm_template_name" {
  default = "UbuntuTemplate"
  type = string
}
variable "vm_guest_id" {
  default = "ubuntu64Guest"
  type = string
}
variable "vm_ipv4_netmask" {
  default = 24
  type = number
}
variable "vm_ipv4_gateway" {
  default = "192.168.41.2"
  type = string
}
variable "vm_dns_servers" {
  default = ["8.8.8.8", "8.8.4.4"]
}
variable "vm_domain" {
  default = ""
  type = string
}
variable "vm_firmware" {
  default = "efi"
  type = string
}
variable "vms" {
  type = map(any)
}
variable "vm_disk_label" {
  default = "disk0"
  type = string
}
variable "vm_disk_size" {
  default = 30
  type = number
}
variable "vm_disk_label2" {
  default = "disk1"
  type = string
}
variable "vm_disk_size2" {
  default = 30
  type = number
}
variable "vm_disk_label3" {
  default = "disk1"
  type = string
}
variable "vm_disk_size3" {
  default = 30
  type = number
}
variable "vm_disk_thin" {
   default = true
   type = bool
}