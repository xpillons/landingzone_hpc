# Map of the remote data state for lower level
variable lower_storage_account_name {}
variable lower_container_name {}
variable lower_resource_group_name {}

variable tfstate_storage_account_name {}
variable tfstate_container_name {}
variable tfstate_key {}
variable tfstate_resource_group_name {}

variable landingzone {
  default = {
    backend_type = "azurerm"
    current = {
      level = "level4"
      key   = "landingzone_hpc"
    }
    lower = {
      foundations = {
        tfstate = "networking_hpc.tfstate"
      }
      # networking = {
      #   foundations = {
      #     tfstate = "networking_hpc.tfstate"
      #   }
      #}
    }
  }
}


variable global_settings {
  default = {}
}

variable landingzone_name {
  default = "hpc"
}
variable level {
  default = "level4"
}
variable environment {
  default = "sandpit"
}
variable rover_version {
  default = null
}
variable logged_user_objectId {
  default = null
}
variable logged_aad_app_objectId {
  default = null
}
variable tags {
  default = null
  type    = map
}
variable diagnostics_definition {
  default = null
}
variable resource_groups {
  default = null
}
variable network_security_group_definition {
  default = null
}
variable storage_accounts {
  default = {}
}
variable azuread_groups {
  default = {}
}
variable keyvaults {
  default = {}
}
variable keyvault_access_policies {
  default = {}
}
variable virtual_machines {
  default = {}
}
variable public_ip_addresses {
  default = {}
}
variable diagnostic_storage_accounts {
  default = {}
}
variable managed_identities {
  default = {}
}
variable private_dns {
  default = {}
}
variable role_mapping {
  default = {}
}
variable vnet_peerings {
  default = {}
}
variable vnets {
  default = {}
}
