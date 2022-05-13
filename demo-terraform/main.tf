
resource "digitalocean_droplet" "devops-demo" {
  image = "ubuntu-20-04-x64"
  name = "devops-demo"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.duna.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx",      
      "cd /etc/ssh/ && sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' sshd_config",
      "systemctl restart ssh && systemctl restart sshd",
      "sudo apt update && sudo apt install ansible -y"
    ]
  }
}