provider "proxmox" {
  pm_api_url          = "https://proxmox:8006/api2/json"
  pm_api_token_id     = "root@pam!terraform"
  pm_api_token_secret = "5fe3ef0b-8002-439b-85b6-33e8ea4d0f5d"
  pm_tls_insecure     = true
}
resource "proxmox_vm_qemu" "lunarArch" {
  clone       = "ArchLinux"
  os_type     = "arch"
  count       = 1
  name        = "lunarArch"
  target_node = var.proxmox_host
  memory      = 4096
  cores       = 4
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 1
  disk {
    slot    = 1
    size    = "32G"
    type    = "scsi"
    storage = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}