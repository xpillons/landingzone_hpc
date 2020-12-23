# Virtual machines
virtual_machines = {
  jumpbox = {
    resource_group_key  = "main"
    os_type             = "linux"
    public_key_pem_file = "~/.ssh/id_rsa.pub"
    networking_interfaces = {
      nic0 = {
        vnet_key                      = "hpcvnet"
        subnet_key                    = "frontend"
        name                          = "jumpbox-nic0"
        enable_accelerated_networking = false
        internal_dns_name_label       = "jumpbox-nic0"
        public_ip_address_key         = "jumpbox_pip"
      }
    }
    virtual_machine_settings = {
      linux = {
        name                            = "jumpbox"
        size                            = "Standard_D2s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
        network_interface_keys = ["nic0"]
        os_disk = {
          name                 = "jumpbox-os"
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

  ondemand = {
    resource_group_key  = "main"
    os_type             = "linux"
    public_key_pem_file = "~/.ssh/id_rsa.pub"
    networking_interfaces = {
      nic0 = {
        vnet_key                      = "hpcvnet"
        subnet_key                    = "frontend"
        name                          = "ondemand-nic0"
        enable_accelerated_networking = false
        internal_dns_name_label       = "ondemand-nic0"
        public_ip_address_key         = "ondemand_pip"
      }
    }
    virtual_machine_settings = {
      linux = {
        name                            = "ondemand"
        size                            = "Standard_D2s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
        network_interface_keys = ["nic0"]
        os_disk = {
          name                 = "ondemand-os"
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

  scheduler = {
    resource_group_key  = "main"
    os_type             = "linux"
    public_key_pem_file = "~/.ssh/id_rsa.pub"
    networking_interfaces = {
      nic0 = {
        vnet_key                      = "hpcvnet"
        subnet_key                    = "admin"
        name                          = "scheduler-nic0"
        enable_accelerated_networking = false
        internal_dns_name_label       = "scheduler-nic0"
      }
    }
    virtual_machine_settings = {
      linux = {
        name                            = "scheduler"
        size                            = "Standard_D2s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
        network_interface_keys = ["nic0"]
        os_disk = {
          name                 = "scheduler-os"
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

  ad = {
    resource_group_key  = "main"
    os_type             = "windows"
    keyvault_key        = "vmsecrets"

    networking_interfaces = {
      nic0 = {
        vnet_key                      = "hpcvnet"
        subnet_key                    = "admin"
        name                          = "ad-nic0"
        enable_accelerated_networking = false
        internal_dns_name_label       = "ad-nic0"
      }
    }
    virtual_machine_settings = {
      windows = {
        name                    = "ad"
        size                    = "Standard_D2s_v3"
        admin_username_key      = "ad-username"
        admin_password_key      = "ad-password"
        network_interface_keys  = ["nic0"]
        os_disk = {
          name                  = "ad-os"
          caching               = "ReadWrite"
          storage_account_type  = "Standard_LRS"
        }
        source_image_reference = {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2016-Datacenter"
          version   = "latest"
        }
        winrm_listener = {
          protocol = "http"
        }
      }
    }
  }
  ccportal = {
    resource_group_key  = "main"
    os_type             = "linux"
    public_key_pem_file = "~/.ssh/id_rsa.pub"
    networking_interfaces = {
      nic0 = {
        vnet_key                      = "hpcvnet"
        subnet_key                    = "frontend"
        name                          = "ccportal-nic0"
        enable_accelerated_networking = false
        internal_dns_name_label       = "ccportal-nic0"
        public_ip_address_key         = "ccportal_pip"
      }
    }
    virtual_machine_settings = {
      linux = {
        name                            = "ccportal"
        size                            = "Standard_D2s_v3"
        admin_username                  = "hpcadmin"
        disable_password_authentication = true
        network_interface_keys = ["nic0"]
        os_disk = {
          name                 = "ccportal-os"
          create_option        = "FromImage"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
        }
        source_image_reference = {
          publisher = "azurecyclecloud"
          offer     = "azure-cyclecloud"
          sku       = "cyclecloud-81"
          version   = "8.1.0"
        }
        plan = {
          name      = "cyclecloud-81"
          publisher = "azurecyclecloud"
          product   = "azure-cyclecloud"
        }
      }
    }
    data_disks = {
      data1 = {
        # Only Empty is supported. More community contributions required to cover other scenarios
        create_option         = "Empty"
        name                  = "ccportal-data1"
        storage_account_type  = "Premium_LRS"
        caching               = "ReadWrite"
        disk_size_gb          = 128
        lun                   = 0
      }
    }

  }

}

