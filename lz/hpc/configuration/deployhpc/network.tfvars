vnets = {
  hpcvnet = {
    resource_group_key = "main"

    vnet = {
      name          = "hpcvnet"
      address_space = ["10.0.0.0/16"]
    }
    specialsubnets = {
      netapp = {
        name    = "netapp"
        cidr    = ["10.0.2.0/24"]
        delegation = {
          name               = "netapp"
          service_delegation = "Microsoft.Netapp/volumes"
          actions = [
            "Microsoft.Network/networkinterfaces/*", 
            "Microsoft.Network/virtualNetworks/subnets/join/action"
          ]
        }
      }
    }
    subnets = {
      frontend = {
        name    = "frontend"
        cidr    = ["10.0.0.0/24"]
        nsg_key = "frontend"
      }
      admin = {
        name    = "admin"
        cidr    = ["10.0.1.0/24"]
      }
      compute = {
        name    = "compute"
        cidr    = ["10.0.16.0/20"]
      }
    }
  }
}

