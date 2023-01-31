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
  project = "c4hnrd-dev"
  # access_token = var.gcp_credentials
}

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "resource_manager_api" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true
}

# resource "google_cloud_run_service_iam_member" "run_all_users" {
#   service  = google_cloud_run_service.run_service.name
#   location = google_cloud_run_service.run_service.location
#   role     = "roles/run.invoker"
#   member   = "allUsers"
# }

# output "service_url" {
#   value = google_cloud_run_service.run_service.status[0].url
# }

resource "google_cloud_run_service" "run_service" {
  name = "app"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run_api, google_project_service.resource_manager_api]
}
