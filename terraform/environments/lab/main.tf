locals {
  vms = {
    vm1 = {
      name = "backup"
      node = "labbet03"
      memory = 4096
      cores = 2
    }
  }
}

module "vms" {
  source = "../../modules/vm"
  for_each = local.vms

  name        = each.value.name
  target_node = each.value.node
  memory      = each.value.memory
  cores       = each.value.cores
  template    = "debian-13-cloud-template"

  ci_user        = "yag"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}
