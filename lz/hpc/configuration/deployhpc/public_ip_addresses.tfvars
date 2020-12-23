public_ip_addresses = {
  jumpbox_pip = {
    name                    = "jumpbox"
    resource_group_key      = "main"
    sku                     = "Basic"
    allocation_method       = "Dynamic"
    ip_version              = "IPv4"
    generate_domain_name_label = true
  }
 ondemand_pip = {
    name                    = "ondemand"
    resource_group_key      = "main"
    sku                     = "Basic"
    allocation_method       = "Dynamic"
    ip_version              = "IPv4"
    generate_domain_name_label = true
  }  
#  ccportal_pip = {
#     name                    = "ccportal"
#     resource_group_key      = "main"
#     sku                     = "Basic"
#     allocation_method       = "Dynamic"
#     ip_version              = "IPv4"
#     generate_domain_name_label = true
#   }  
}