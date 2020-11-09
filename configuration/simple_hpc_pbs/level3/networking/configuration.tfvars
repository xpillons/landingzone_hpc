landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "shared_services"
  level               = "level3"
  key                 = "networking_hpc"
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "caf_shared_services.tfstate"
    }
  }
}
resource_groups = {
  vnet_hub_re1 = {
    name   = "vnet-hub-re1"
    region = "region1"
  }
}
