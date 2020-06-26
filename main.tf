provider "docker" {}

variable data_path {
    type = string
}

resource "docker_image" "data" {
    name = "slyness-data:latest" 
    keep_locally = true
}

resource "docker_image" "reporter" {
    name = "slyness-reporter:latest" 
    keep_locally = true
}

resource "docker_container" "slyness-data" {
    name = "slyness-data"
    image = docker_image.data.latest
    env = ["POSTGRES_PASSWORD=password", "POSTGRES_DB=reporter"]
    ports {
        internal = 5432
        external = 5432
    }
    volumes {
        container_path = "/data"
        host_path = var.data_path
    }
}

resource "docker_container" "slyness-reporter" {
    name = "slyness-reporter"
    image = docker_image.reporter.latest
    ports {
        internal = 3000
        external = 8080
    }
    depends_on =  [docker_container.slyness-data]
}