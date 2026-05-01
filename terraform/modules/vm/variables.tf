variable "name" {
  description = "VM name"
  type        = string
}

variable "target_node" {
  description = "Proxmox node"
  type        = string
}

variable "template" {
  description = "Template name"
  type        = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "display" {
  type    = string
  default = "qxl"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "20G"
}

variable "storage" {
  description = "Storage pool"
  type        = string
  default     = "SSD-VM"
}

variable "ci-storage" {
  description = "Cloud init storage"
  type        = string
  default     = "STORAGE"
}

variable "bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "ci_user" {
  description = "Cloud-init user"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

variable "ipconfig0" {
  description = "Cloud-init network config"
  type        = string
  default     = "ip=dhcp"
}