#biến kết nối với vcenter
variable "vsphere_user" {  type = string }
variable "vsphere_password" { 
  type = string
  sensitive = true
}
variable "vsphere_server" { type = string}
variable "vsphere_datacenter" {type = string}
variable "vsphere_host" {type = string}
variable "vsphere_compute_cluster" {type = string}
variable "vsphere_datastore" {type = string}
variable "vsphere_network" {type = string}
#Biến sử dụng template clone
variable "vm_template_name" {type = string}
variable "vm_guest_id" {type = string}
variable "vm_ipv4_netmask" {type = number}
variable "vm_ipv4_gateway" {type = string}
variable "vm_disk_thin" {
   default = true
   type = bool
}
variable "vm_domain" {type = string}
variable "vm_firmware" {type = string }
#Biến edit các máy chủ
variable "vms" { type = map(any)}
variable "disks" {
  default = [
    {
      label            = "disk1"
      size             = 25
      thin_provisioned = true
      unit_number      = 0
    },
    {
      label            = "disk2"
      size             = 10
      thin_provisioned = true
      unit_number      = 1
    },
    {
      label            = "disk3"
      size             = 5
      thin_provisioned = true
      unit_number      = 2
    }
  ]
  type = list(object({
    label            = string
    size             = number
    thin_provisioned = bool
    unit_number      = number
  }))
}