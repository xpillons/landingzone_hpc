# Question => How to specify just the key and keep all the others as default values ?
landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level0"
  key                 = "hpc_landingzone"
  tfstates = {
    launchpad = {
      level   = "current"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}

global_settings = {
  default_region = "westeurope"
  regions = {
    westeurope = "westeurope",
    southcentralus = "southcentralus"
  }
}

resource_groups = {
  main = {
    name = "hpc_landingzone"
  }
}

