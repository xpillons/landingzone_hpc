terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.40.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.1.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "~> 1.2.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 2.2.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.1.0"
    }
  }
  required_version = ">= 0.13"
}


provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

# resource "tls_private_key" "internal" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "private_key" {
#     sensitive_content     = tls_private_key.internal.private_key_pem
#     filename = "hpcadmin_id_rsa"
#     file_permission = "0600"
# }

# resource "local_file" "public_key" {
#     content     = tls_private_key.internal.public_key_openssh
#     filename = "hpcadmin_id_rsa.pub"
#     file_permission = "0644"
# }