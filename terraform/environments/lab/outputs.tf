output "vms" {
  value = {
    for name, vm in module.vms :
    name => {
      vmid = vm.vmid
      name = vm.name
      ip = vm.ip
    }
  }
}
