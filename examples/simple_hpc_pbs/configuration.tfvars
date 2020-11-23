landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level0"
  key                 = "simple_hpc_pbs"
  tfstates = {
    launchpad = {
      level   = "current"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}

# global_settings = {
#   default_region = "region1"
#   regions = {
#     region1 = "southeastasia"
#   }
# }

resource_groups = {
  rg1 = {
    name = "simple_hpc_pbs"
  }
}

# Virtual machines
virtual_machines = {

  # Configuration to deploy a bastion host linux virtual machine
  headnode = {
    resource_group_key                   = "rg1"
    provision_vm_agent                   = true
#    boot_diagnostics_storage_account_key = "bootdiag_region1"

    os_type = "linux"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "headnode_vm_rg1"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key                = "hpcvnet"
        subnet_key              = "admin"
        name                    = "0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "nic0"
        public_ip_address_key   = "headnode_vm_pip1_rg1"
      }
    }

    virtual_machine_settings = {
      linux = {
        name                            = "headnode"
        size                            = "Standard_D8s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
#        custom_data                     = "scripts/cloud-init/install-rover-tools.config"

        # Spot VM to save money
        # priority        = "Spot"
        # eviction_policy = "Deallocate"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        os_disk = {
          name                 = "headnode-os"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
        }

        source_image_reference = {
          publisher = "Canonical"
          offer     = "UbuntuServer"
          sku       = "18.04-LTS"
          version   = "latest"
        }

      }
    }

  }
}


# diagnostic_storage_accounts = {
#   # Stores boot diagnostic for region1
#   bootdiag_region1 = {
#     name                     = "bootrg1"
#     resource_group_key       = "rg1"
#     account_kind             = "StorageV2"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     access_tier              = "Cool"
#   }
# }



keyvaults = {
  headnode_vm_rg1 = {
    name               = "vmsecrets"
    resource_group_key = "rg1"
    sku_name           = "standard"
  }
}

keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  headnode_vm_rg1 = {
    logged_in_user = {
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
    logged_in_aad_app = {
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
}

vnets = {
  hpcvnet = {
    resource_group_key = "rg1"

    vnet = {
      name          = "hpcvnet"
      address_space = ["10.2.0.0/20"]
    }
    specialsubnets = {}
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

public_ip_addresses = {
  headnode_vm_pip1_rg1 = {
    name                    = "headnode_vm_pip1"
    resource_group_key      = "rg1"
    # sku                     = "Standard"
    # allocation_method       = "Dynamic"
    # ip_version              = "IPv4"
    #idle_timeout_in_minutes = "4"
  }
}