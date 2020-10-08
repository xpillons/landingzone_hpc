landingzone = {
  backend_type = "azurerm"
  current = {
    level = "level3"
    key   = "networking_spoke_hpc"
    # networking = {
    #   networking_spoke_hpc = {
    #     tfstate = "doesnotmatter_since_its_local"
    #   }
    # }
  }
  lower = {
    shared_services = {
      tfstate = "caf_shared_services.tfstate"
    }
    networking = {
      networking_hub = {
        tfstate = "caf_networking.tfstate"
      }

    }
  }
}

resource_groups = {
  hpc_spoke = {
    name   = "hpc-spoke"
    region = "region1"
  }
  hpc_rg1 = {
    name   = "hpc-cluster"
    region = "region1"
  }
}

vnets = {
  networking_spoke_hpc = {
    resource_group_key = "hpc_spoke"
    region             = "region1"
    vnet = {
      name          = "hpcvnet"
      address_space = ["10.2.0.0/20"]
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
        nsg_key = "empty_nsg"
      }
      storage = {
        name    = "storage"
        cidr    = ["10.2.3.0/24"]
        nsg_key = "empty_nsg"
      }
      viz = {
        name    = "viz"
        cidr    = ["10.2.4.0/24"]
        nsg_key = "empty_nsg"
      }
      compute = {
        name    = "compute"
        cidr    = ["10.2.8.0/22"]
        nsg_key = "empty_nsg"
      }
    }
  }
}

vnet_peerings = {
  hub_rg1_TO_hpcvnet = {
    from = {
      lz_key   = "networking_hub"
      vnet_key = "hub_rg1"
    }
    to = {
      vnet_key = "networking_spoke_hpc"
    }
    name = "hub_rg1_TO_hpcvnet"
  }

  hpcvnet_TO_hub_rg1 = {
    from = {
      vnet_key = "networking_spoke_hpc"
    }
    to = {
      lz_key   = "networking_hub"
      vnet_key = "hub_rg1"
    }
    name = "hpcvnet_TO_hub_rg1"
  }
}

#
# Definition of the networking security groups
#
network_security_group_definition = {
  # This entry is applied to all subnets with no NSG defined
  empty_nsg = {
    nsg = []
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

