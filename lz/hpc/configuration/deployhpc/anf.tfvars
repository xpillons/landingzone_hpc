netapp_accounts = {
  account1 = {
    name = "deployhpc-1234"
    resource_group_key = "main"
    pools = {
      anfpool = {
        name          = "anfpool-1234"
        service_level = "Standard"
        size_in_tb    = 4
        volumes = {
          anfhome = {
            name        = "anfhome"
            # Must be unique to the subscription
            volume_path = "home-1234"
            vnet_key    = "hpcvnet"
            subnet_key  = "netapp"
            protocols   = ["NFSv3"]
            storage_quota_in_gb = 100
          }
        }
      }
    }
  }
}