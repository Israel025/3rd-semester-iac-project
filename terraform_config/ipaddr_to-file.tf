#==================================
# Save the ip address of the instances to a file
locals {
  ip_addrs = [for server in aws_instance.web_servers : server.public_ip]
}

resource "local_file" "Ip_address" {
  filename = var.local-file_path
  content  = <<EOT
[k8s-server]
${local.ip_addrs[0]}
  EOT
}


#==================================
# create ansible var yaml file with the instance public ip

resource "local_file" "Ip_yaml" {
  filename = var.ansibleVar-file_path
  content  = <<EOT
---
server-pub-ip: ${local.ip_addrs[0]}
  EOT
}
