module "landingzone_hpc" {
  source  = "github.com/aztfmod/terraform-azurerm-caf?ref=0.4"
  #version = "0.4.0-preview1"
  # source  = "/tf/caf/module"

  tags                     = local.tags
  diagnostics              = local.diagnostics
  global_settings          = local.global_settings
  tfstates                 = local.tfstates
  logged_user_objectId     = var.logged_user_objectId
  logged_aad_app_objectId  = var.logged_aad_app_objectId
  resource_groups          = var.resource_groups
  keyvaults                = var.keyvaults
  keyvault_access_policies = var.keyvault_access_policies
  networking = {
    vnets              = var.vnets
    networking_objects = {}
    vnet_peerings      = var.vnet_peerings
    network_security_group_definition = var.network_security_group_definition
    public_ip_addresses = var.public_ip_addresses
  }
  compute = {
    virtual_machines = var.virtual_machines
  }
  storage_accounts   = var.storage_accounts
  managed_identities = var.managed_identities
  remote_objects = {
    networking = merge(local.lower_networking, local.current_networking)
  }

}
