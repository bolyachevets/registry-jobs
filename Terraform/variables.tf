variable "environment" {
  type = object({
    project_id     = string
  })
  description = "Terraform GCP parameters"

  default = {
    project_id      = "c4hnrd-dev"
  }
}

variable "test_job" {
  type = object({
    name                   = string
    image                  = string
    github_repository      = string
    github_branch          = string
    subdir                 = string
    registry_repo          = string
    tag                    = string
  })
  description = "GCP Test job"

  default = {
    name       = "sre-nr-day-job"
    image      = "sre-nr-day-job-image"
    registry_repo = "sre-repo"
    github_repository = "registry-jobs"
    github_branch = "^main$"
    subdir     = "nr-day-job"
    tag        = "dev"
  }
}

variable "region" {
    default = "us-west2"
}

variable "github_owner" {
    default = "bolyachevets"
}

variable "nro_extractor_uri" {
    default = "https://namex-api-dev.apps.silver.devops.gov.bc.ca/api/v1/nro-extract/nro-requests"
}
variable "db_connection" {
  type = object({
    host = string
    port = string
    })
  description = "oc port forwarded db connection"
  default = {
    host = "localhost"
    port = "8006"
  }
}
