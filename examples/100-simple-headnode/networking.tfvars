level = "level2"

landingzone_name = "networking_hpc"

tfstates = {
  caf_foundations = {
    tfstate = "caf_foundations.tfstate"
  }
  networking = {
    tfstate = "caf_foundations.tfstate"
  }
}

resource_groups = {
  vnet_hub_rg1 = {
    name   = "vnet-hub-rg1"
    region = "region1"
  }
}

vnets = {
  hpcvnet = {
    resource_group_key = "vnet_hub_rg1"
    region             = "region1"
    vnet = {
      name          = "hpcvnet"
      address_space = ["10.2.0.0/20"]
    }
    specialsubnets = {
    }
    subnets = {
      admin = {
        name    = "admin"
        cidr    = ["10.2.1.0/24"]
        nsg_key = "admin"
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


#
# Definition of the networking security groups
#
network_security_group_definition = {
  # This entry is applied to all subnets with no NSG defined
  empty_nsg = {
  }

  admin = {
    nsg = [
      {
        name                       = "ssh-inbound-22",
        priority                   = "200"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
      }
    ]
  }

}

