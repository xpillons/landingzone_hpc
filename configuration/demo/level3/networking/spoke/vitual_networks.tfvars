vnets = {
  spoke_hpc_re1 = {
    resource_group_key = "hpc_spoke_re1"
    region             = "region1"
    vnet = {
      name          = "hpc"
      address_space = ["10.64.48.0/22"]
    }
    specialsubnets = {}
    subnets = {
      admin = {
        name    = "admin"
        cidr    = ["10.64.48.0/24"]
        nsg_key = "azure_bastion_nsg"
      }
      compute = {
        name    = "compute"
        cidr    = ["10.64.49.0/24"]
        nsg_key = "azure_bastion_nsg"
      }
      storage = {
        name    = "storage"
        cidr    = ["10.64.50.0/24"]
        nsg_key = "azure_bastion_nsg"
      }
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet" #Must be called AzureBastionSubnet
        cidr    = ["10.64.51.64/27"]
        nsg_key = "azure_bastion_nsg"
      }
      private_endpoints = {
        name                                           = "private_endpoints"
        cidr                                           = ["10.64.51.0/27"]
        enforce_private_link_endpoint_network_policies = true
      }
      jumpbox = {
        name    = "jumpbox"
        cidr    = ["10.64.51.128/27"]
        nsg_key = "azure_bastion_nsg"
      }
    }

  }
}