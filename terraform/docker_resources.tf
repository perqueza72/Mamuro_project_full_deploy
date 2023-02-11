# Pulls the image
resource "docker_image" "go_server" {
  name = "docker.io/library/go_server:1.0"
}

resource "docker_image" "mamuro_vue" {
  name = "docker.io/library/vue_mamuro_front:1.0"
}

resource "docker_image" "zinc_db" {
  name = "docker.io/library/zinc_db:1.0"
}

resource "docker_image" "zinc_indexer" {
  name = "docker.io/library/zinc_indexer:0.1"
}

# Create a containers
resource "docker_container" "zinc_db" {
  image = docker_image.zinc_db.name
  name  = "zinc_db"

  depends_on = [
    null_resource.startup
  ]

  # networks_advanced {
  #   name = docker_network.internal_network.name
  # }
}

resource "docker_container" "zinc_indexer" {
  image = docker_image.zinc_indexer.name
  name  = "zinc_indexer"

  depends_on = [
    docker_container.zinc_db
  ]

  # networks_advanced {
  #   name = docker_network.internal_network.name
  # }
}

resource "docker_container" "server" {
  image = docker_image.go_server.name
  name  = "server"

  depends_on = [
    docker_container.zinc_db
  ]

  # networks_advanced {
  #   name = docker_network.internal_network.name
  # }
}

resource "docker_container" "front_end" {
  image = docker_image.mamuro_vue.name
  name  = "front_end"

  depends_on = [
    docker_image.go_server
  ]

  # networks_advanced {
  #   name = docker_network.internal_network.name
  # }
}

# resource "docker_network" "internal_network" {
#   name   = "mamuro"
#   driver = "bridge"
# }
