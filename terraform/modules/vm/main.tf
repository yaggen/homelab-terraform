resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  target_node = var.target_node
  clone       = var.template

  cpu {
    cores = 2
  }
  memory = var.memory

  agent = 1

  os_type = "cloud-init"

  # Disk
  disk {
    slot    = "scsi0"
    size    = var.disk_size
    type    = "disk"
    storage = var.storage
  }

  disk {
    slot    = "ide1"
    type    = "cloudinit"
    storage = var.ci-storage
  }

  # Display
  vga {
    type = var.display
  }

  # Network
  network {
    id = 0
    model  = "virtio"
    bridge = var.bridge
  }

  # Cloud-init
  ciuser  = var.ci_user
  sshkeys = var.ssh_public_key
  ipconfig0 = var.ipconfig0

  # Boot config
  boot = "order=scsi0"

  # Optional but useful
  scsihw = "virtio-scsi-pci"
}