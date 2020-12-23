# Store output attributes into keyvault secret
dynamic_keyvault_secrets = {
  vmsecrets = { # Key of the keyvault
    ad-username = {
      secret_name = "ad-username"
      value       = "hpcadmin"
    }
    ad-password = {
      secret_name = "ad-password"
      value       = "how to use external value here ?"
    }
  }
}