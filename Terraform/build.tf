# gcp github repo needs to be created (i.e. seeded)
# first image needs to be seeded as well
# cd /home/andriy_bolyachevets/cloudshell_open/
# git clone https://github.com/bolyachevets/registry-jobs
# gcloud builds submit --region=us-west2 --tag us-west2-docker.pkg.dev/c4hnrd-dev/sre-repo/sre-nr-day-job-image:dev

data "google_artifact_registry_repository" "job_repo" {
    repository_id = "sre-repo"
    location = var.region
}

resource "google_cloudbuild_trigger" "repo_trigger" {
  name        = "sre-repo"
  location = var.region

  trigger_template {
    branch_name = "main"
    repo_name   = "${var.github_owner}/${var.test_job.github_repository}"
  }

  substitutions = {
    _LOCATION = var.region
    _REGISTRY_REPO = var.test_job.registry_repo
    _TAG = var.test_job.tag
    _IMAGE = var.test_job.image
  }

  filename = "cloudbuild.yaml"
}
