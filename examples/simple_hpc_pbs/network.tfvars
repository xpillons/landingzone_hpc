
vnets = {
  hpcvnet = {
    resource_group_key = "main"

    vnet = {
      name          = "hpcvnet"
      address_space = ["10.2.0.0/20"]
    }
    specialsubnets = {
      netapp = {
        name    = "netapp"
        cidr    = ["10.2.2.0/24"]
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
      admin = {
        name    = "admin"
        cidr    = ["10.2.1.0/24"]
        nsg_key = "ssh"
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

