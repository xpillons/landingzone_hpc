landingzone = {
  backend_type = "azurerm"
  level        = "level0"
  key          = "launchpad"
}


# Default region. When not set to a resource it will use that value
default_region = "region1"

# Inherit_tags defines if a resource will inherit it's resource group tags
inherit_tags = true

regions = {
  region1 = "westeurope"
}

launchpad_key_names = {
  azuread_app            = "caf_launchpad_level0"
  keyvault_client_secret = "aadapp-caf-launchpad-level0"
  tfstates = [
    "level0",
  ]
}

resource_groups = {
  level0 = {
    name = "launchpad-level0"
    tags = {
      level = "level0"
    }
  }
}

