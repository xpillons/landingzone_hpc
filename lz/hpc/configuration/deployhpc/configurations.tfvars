landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level0"
  key                 = "deployhpc"
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
    name = "deployhpc"
  }
}

