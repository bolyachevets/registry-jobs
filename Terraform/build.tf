# gcp github repo needs to be created (i.e. seeded)
# first image needs to be seeded as well
# cd /home/andriy_bolyachevets/cloudshell_open/
# git clone https://github.com/bolyachevets/registry-jobs
# gcloud builds submit --region=us-west2 --tag us-west2-docker.pkg.dev/c4hnrd-dev/sre-repo/sre-nr-day-job-image:dev

data "google_artifact_registry_repository" "job_repo" {
    repository_id = "sre-repo"
    location = var.region
}

  resource "google_cloudbuild_trigger" "manual-trigger" {
    name        = "sre-repo"
    location = "us-west2"

  source_to_build {
    uri       = "https://github.com/bolyachevets/registry-jobs"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build","-t", "${var.region}-docker.pkg.dev/$${PROJECT_ID}/${var.test_job.image}:$${SHORT_SHA}", "-t", "${var.region}-docker.pkg.dev/$${PROJECT_ID}/${var.test_job.image}:dev", "."]
      dir = "nr-day-job"
    }
    artifacts {
      images = ["${var.region}-docker.pkg.dev/$${PROJECT_ID}/${var.test_job.image}:dev"]
    }
  }
}
