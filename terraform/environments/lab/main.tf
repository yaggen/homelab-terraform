locals {
  vms = {
    vm1 = {
      name = "debian-vm-01"
      node = "labbet02"
    }
    vm2 = {
      name = "debian-vm-02"
      node = "labbet03"
    }
  }
}

module "vms" {
  source = "../../modules/vm"
  for_each = local.vms

  name        = each.value.name
  target_node = each.value.node
  template    = "debian-13-cloud-template"

  ci_user        = "yag"
  ssh_public_key = file("~/.ssh/id_rsa.pub")
}