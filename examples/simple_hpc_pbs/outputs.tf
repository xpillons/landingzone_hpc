output virtual_machines {
  value = module.caf.virtual_machines
}

# resource "local_file" "private_key" {
#     content     = tls_private_key.internal.private_key_pem
#     filename = "foo_id_rsa"
#     file_permission = "0600"
# }

# resource "local_file" "public_key" {
#     content     = tls_private_key.internal.public_key_openssh
#     filename = "foo_id_rsa.pub"
#     file_permission = "0644"
# }
