landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "shared_services"
  level               = "level3"
  key                 = "networking_spoke_hpc"
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "caf_shared_services.tfstate"
    }
    networking_hub = {
      level   = "lower"
      tfstate = "networking_hub.tfstate"
    }
  }
}


resource_groups = {
  hpc_spoke_re1 = {
    name   = "hpc-vnet-spoke-re1"
    region = "region1"
  }
}



