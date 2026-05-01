output "name" {
  value = proxmox_vm_qemu.vm.name
}

output "vmid" {
  value = proxmox_vm_qemu.vm.vmid
}

output "ip" {
  value = proxmox_vm_qemu.vm.default_ipv4_address
}