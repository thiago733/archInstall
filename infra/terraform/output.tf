output "proxmox_ip_address_manager" {
  description = "Current IP Arch"
  value       = proxmox_vm_qemu.lunarArch.*.default_ipv4_address
}