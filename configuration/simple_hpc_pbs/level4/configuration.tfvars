landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "networking_hpc"
  level               = "level4"
  key                 = "simple_hpc_pbs"
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "networking_hpc.tfstate"
    }
  }
}

resource_groups = {
  simple_hpc_pbs = {
    name   = "simple-hpc-pbs"
    region = "region1"
  }
}
