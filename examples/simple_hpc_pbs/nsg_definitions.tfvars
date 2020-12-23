network_security_group_definition = {

  ssh = {

    nsg = [
      {
        name                       = "bastion-vnet-in-allow-22"
        priority                   = "103"
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