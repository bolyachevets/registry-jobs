# add image builder
# set up repository watcher
# https://cloud.google.com/build/docs/automate-builds
terraform {
  cloud {
    organization = "BCRegistry"
    workspaces {
      name = "gcp-jobs-dev"
    }
  }
}

terraform {
  required_providers {
    google = ">= 3.3"
  }
}

provider "google" {
  project = var.environment.project_id
}
