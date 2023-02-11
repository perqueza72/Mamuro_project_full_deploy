terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }

  }
}

resource "null_resource" "startup" {

  provisioner "local-exec" {

    command = "sudo bash ./../startup.sh"
  }
}


output "network_data" {
  value = "${docker_container.front_end.network_data}"
}

output "ip_addresses" {
  value = "${tolist([
    lookup(docker_container.front_end.network_data[0], "ip_address")
    ]
  )}"
}