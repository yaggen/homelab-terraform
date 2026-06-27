locals {
  vms = {
    vm1 = {
      name      = "backup"
      node      = "labbet03"
      memory    = 4096
      cores     = 2
      ipconfig0 = "ip=192.168.30.25/24,gw=192.168.30.1"
    }
    vm2 = {
      name      = "monitoring"
      node      = "labbet02"
      memory    = 4096
      cores     = 2
      ipconfig  = "ip=192.168.30.26/24,gw=192.168.30.1"
    }
    vm3 = {
      name      = "immich"
      node      = "labbet03"
      memory    = 8192
      cores     = 4
      ipconfig  = "ip=192.168.30.27/24,gw=192.168.30.1"
      extra_disk_size = "100G"
      extra_disk_storage = "local-lvm"
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
  extra_disk_size    = try(each.value.extra_disk_size, null)
  extra_disk_storage = try(each.value.extra_disk_storage, "local-lvm")

  ci_user        = "yag"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}
