
keyvaults = {
  vmsecrets = {
    name               = "vmsecrets"
    resource_group_key = "main"
    sku_name           = "standard"
  }
}

keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  vmsecrets = {
    logged_in_user = {
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
    logged_in_aad_app = {
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
}

