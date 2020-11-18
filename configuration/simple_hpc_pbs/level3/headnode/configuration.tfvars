landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "shared_services"
  level               = "level3"
  key                 = "headnode"
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "caf_shared_services.tfstate"
    }
    networking_hpc = {
      level   = "current"
      tfstate = "networking.tfstate"
    }
  }
}

resource_groups = {
  simple_hpc_pbs = {
    name   = "simple-hpc-pbs"
    region = "region1"
  }
}
