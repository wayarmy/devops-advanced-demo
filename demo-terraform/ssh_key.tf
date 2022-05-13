# Define all private keys of DO account
data "digitalocean_ssh_key" "duna" {
  name = "duna"
}

data "digitalocean_ssh_key" "quanpc" {
  name = "sam"
}