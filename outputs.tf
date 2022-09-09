output "vm_ip_azure" {
  value = azurerm_linux_virtual_machine.linux_vm.public_ip_address
}

output "vm_ip_aws" {
  value = aws_instance.vm.public_ip
}
