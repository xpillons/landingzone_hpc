
storage_accounts = {
  level0 = {
    name                     = "level0"
    resource_group_key       = "level0"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      ## Those tags must never be changed after being set as they are used by the rover to locate the launchpad and the tfstates.
      # Only adjust the environment value at creation time
      tfstate     = "level0"
      environment = "sandpit"
      launchpad   = "launchpad"
      ##
    }
    containers = {
      tfstate = {
        name = "tfstate"
      }
    }
  }

}