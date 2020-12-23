# Virtual machines
virtual_machines = {

  jumpbox = {
    resource_group_key                   = "main"

    os_type = "linux"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "vmsecrets" 

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        vnet_key                      = "hpcvnet"
        subnet_key                    = "frontend"
        name                          = "0"
        #enable_accelerated_networking = true
        internal_dns_name_label      = "nic0"
        public_ip_address_key         = "jumpbox_pip"
      }
    }

    virtual_machine_settings = {
      linux = {
        name                            = "jumpbox"
        size                            = "Standard_D2s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
#        custom_data                     = "scripts/cloud-init/install-rover-tools.config"


        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        os_disk = {
          #name                 = "jumpbox-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
        }

        source_image_reference = {
          publisher = "OpenLogic"
          offer     = "CentOS"
          sku       = "7.7"
          version   = "latest"
        }

      }
    }
  }
}


public_ip_addresses = {
  jumpbox_pip = {
    name                    = "jumpbox_pip"
    resource_group_key      = "main"
    sku                     = "Basic"
    allocation_method       = "Dynamic"
    ip_version              = "IPv4"
    #idle_timeout_in_minutes = "4"
  }
}