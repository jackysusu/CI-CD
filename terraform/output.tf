output "VM_NAME" {
  value = vsphere_virtual_machine.vm.*.name
}

output "PUBLIC_IP" {
  value = vsphere_virtual_machine.vm.*.clone.0.customize.0.network_interface.0.ipv4_address
}