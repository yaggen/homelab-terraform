terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "= 3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://192.168.30.14:8006/api2/json"
  pm_api_token_id     = var.pm_token_id
  pm_api_token_secret = var.pm_token_secret
  pm_tls_insecure     = true
}