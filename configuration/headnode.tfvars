level = "level3"
tfstates = {
  caf_foundations = {
    tfstate = "caf_foundations.tfstate"
  }
  networking = {
    tfstate = "caf_networking.tfstate"
  }
}

resource_groups = {
  hpc_rg1 = {
    name   = "hpc-cluster"
    region = "region1"
  }
}

virtual_machines = {

  # Configuration to deploy a headnode host linux virtual machine
  headnode = {
    resource_group_key                   = "hpc_rg1"
    region                               = "region1"
#    boot_diagnostics_storage_account_key = "bootdiag_region1"
    provision_vm_agent                   = true

    os_type = "linux"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "secrets"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        networking = {
          remote_tfstate = {
            tfstate_key = "networking_hpc"
            output_key  = "vnets"
            lz_key      = "caf_networking"
          vnet_key    = "hpcvnet"
          subnet_key = "admin"
          }

        }
        name                    = "0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "nic0"

        # you can setup up to 5 profiles
        # diagnostic_profiles = {
        #   operations = {
        #     definition_key   = "nic"
        #     destination_type = "log_analytics"
        #     destination_key  = "central_logs"
        #   }
        # }

      }
    }

    virtual_machine_settings = {
      linux = {
        name                            = "headnode"
        size                            = "Standard_F2"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
        #custom_data                     = "scripts/cloud-init-install-rover-tools.config"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        os_disk = {
          name                 = "headnode-os"
          caching              = "ReadWrite"
          storage_account_type = "Premium_LRS"
        }

        source_image_reference = {
          publisher = "Openlogic"
          offer     = "CentOS"
          sku       = "7.7"
          version   = "latest"
        }

        # identity = {
        #   type = "UserAssigned"
        #   # remote_state = {
        #   # }
        #   managed_identity_keys = [
        #     "level0", "level1", "level2", "level3", "level4"
        #   ]
        # }

      }
    }

  }
}

##################################################
#
# Networking resources
#
##################################################


public_ip_addresses = {
  headnode_pip = {
    name                    = "headnode-pip"
    resource_group_key      = "hpc_rg1"
    sku                     = "Standard"
    allocation_method       = "Dynamic"
    ip_version              = "IPv4"
    #idle_timeout_in_minutes = "4"

    # you can setup up to 5 key
    # diagnostic_profiles = {
    #   bastion_host_rg1 = {
    #     definition_key   = "public_ip_address"
    #     destination_type = "log_analytics"
    #     destination_key  = "central_logs"
    #   }
    # }

  }
}

keyvaults = {
  # Do not rename the key "launchpad" to be able to upgrade to the standard launchpad
  secrets = {
    name                = "secrets"
    resource_group_key  = "hpc_rg1"
    region              = "region1"
    sku_name            = "standard"
    soft_delete_enabled = false
  }
}

keyvault_access_policies = {
  # A maximum of 16 access policies per keyvault
  secrets = {
    logged_in_user = {
      # if the key is set to "logged_in_user" add the user running terraform in the keyvault policy
      # More examples in /examples/keyvault
      secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
}

