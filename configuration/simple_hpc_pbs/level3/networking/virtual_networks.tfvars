
vnets = {
  hpcvnet = {
    resource_group_key = "vnet_hub_re1"
    region             = "region1"
    vnet = {
      name          = "hpcvnet"
      address_space = ["10.2.0.0/20"]
    }

    subnets = {
      admin = {
        name    = "admin"
        cidr    = ["10.2.1.0/24"]
      }
      netapp = {
        name    = "netapp"
        cidr    = ["10.2.2.0/24"]
      }
      storage = {
        name    = "storage"
        cidr    = ["10.2.3.0/24"]
      }
      viz = {
        name    = "viz"
        cidr    = ["10.2.4.0/24"]
      }
      compute = {
        name    = "compute"
        cidr    = ["10.2.8.0/22"]
      }
    }
  }
}
