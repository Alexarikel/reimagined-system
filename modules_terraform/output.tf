output "vm_ip" {
  description = "ip address of the deployed VM"
  value       = vsphere_virtual_machine.vm.network_interface[0]
}
