output virtual_machines {
  value = module.caf.virtual_machines
}

data "azurerm_key_vault_secret" "public" {
  name         = module.caf.virtual_machines["jumpbox"].ssh_keys.ssh_private_key_open_ssh
  key_vault_id = module.caf.virtual_machines["jumpbox"].ssh_keys.keyvault_id
}

data "azurerm_key_vault_secret" "private" {
  name         = module.caf.virtual_machines["jumpbox"].ssh_keys.ssh_private_key_pem
  key_vault_id = module.caf.virtual_machines["jumpbox"].ssh_keys.keyvault_id
}

# output "secret_value" {
#   value = data.azurerm_key_vault_secret.sshkey.value
# }

resource "local_file" "private_key" {
    sensitive_content     = data.azurerm_key_vault_secret.private.value
    filename = "foo_id_rsa"
    file_permission = "0600"
}

resource "local_file" "public_key" {
    sensitive_content     = data.azurerm_key_vault_secret.public.value
    filename = "foo_id_rsa.pub"
    file_permission = "0644"
}
