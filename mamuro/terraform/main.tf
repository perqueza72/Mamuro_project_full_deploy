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

