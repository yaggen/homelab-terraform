locals {
  vms = {
    vm1 = {
      name      = "backup"
      node      = "labbet03"
      memory    = 4096
      cores     = 2
      ipconfig0 = "ip=192.168.30.25/24,gw=192.168.30.1"
    }
  }
}

module "vms" {
  source   = "../../modules/vm"
  for_each = local.vms

  name        = each.value.name
  target_node = each.value.node
  memory      = each.value.memory
  cores       = each.value.cores
  ipconfig0   = try(each.value.ipconfig0, "ip=dhcp")
  template    = "debian-13-cloud-template"

  ci_user        = "yag"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}
