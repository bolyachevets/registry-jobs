terraform {
  cloud {
    organization = "BCRegistry"
    workspaces {
      name = "ocp-container-registry-dev"
    }
  }
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
    registry_auth {
      address  = "gcr.io"
      username = "_json_key"
      password = var.GOOGLE_CREDENTIALS
    }
}


resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}
