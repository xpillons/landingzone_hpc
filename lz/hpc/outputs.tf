output virtual_machines {
  value = module.caf.virtual_machines
}

# data "azurerm_key_vault_secret" "public" {
#   name         = module.caf.virtual_machines["jumpbox"].ssh_keys.ssh_private_key_open_ssh
#   key_vault_id = module.caf.virtual_machines["jumpbox"].ssh_keys.keyvault_id
# }

# data "azurerm_key_vault_secret" "private" {
#   name         = module.caf.virtual_machines["jumpbox"].ssh_keys.ssh_private_key_pem
#   key_vault_id = module.caf.virtual_machines["jumpbox"].ssh_keys.keyvault_id
# }

# data "azurerm_virtual_machine" "jumpbox" {
#   name = module.caf.virtual_machines["jumpbox"].name
#   resource_group_name = module.caf.virtual_machines["jumpbox"].resource_group_name
# }

# How to get the private IP ?
# output jumpbox_ip {
#   value = module.caf.virtual_machines["jumpbox"].private_ip_address
# }

output public_ips {
  value = module.caf.public_ip_addresses
}
# Issue => ip_address is empty after the first apply
# output jumpbox_pip {
#   value = module.caf.public_ip_addresses["jumpbox_pip"]
# }
# output ondemand_pip {
#   value = module.caf.public_ip_addresses["ondemand_pip"]
# }
# jumpbox_pip = {
#   "fqdn" = "xeck-pip-jumpbox.westeurope.cloudapp.azure.com"
#   "id" = "/subscriptions/f5a67d06-2d09-4090-91cc-e3298907a021/resourceGroups/xeck-rg-deployhpc/providers/Microsoft.Network/publicIPAddresses/xeck-pip-jumpbox"
#   "ip_address" = ""
# }
# virtual_machines = {
#   "jumpbox" = {
#     "admin_username" = "hpcadmin"
#     "id" = "/subscriptions/f5a67d06-2d09-4090-91cc-e3298907a021/resourceGroups/xeck-rg-deployhpc/providers/Microsoft.Compute/virtualMachines/xeck-vm-jumpbox"
#     "internal_fqdns" = [
#       "nic0.10ewtffjn3ne1onzefrkmt2tca.ax.internal.cloudapp.net",
#     ]
#     "os_type" = "linux"
#   }
# }

output anf {
  value = module.caf.netapp_accounts
}