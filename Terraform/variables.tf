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
    name      = string
    image     = string
  })
  description = "GCP Test job"

  default = {
    name       = "sre-nr-day-job"
    image      = "sre-repo/sre-nr-day-job-image"
  }
}

variable "test_job_container_env" {
  type = object({
    nats_client_name = string
    nats_nr_state_subject = string
    solr_base_url = string
    nro_extractor_uri = string
    solr_synonyms_api_url = string
    nats_servers = string
    nats_queue = string
    auto_analyze_config = string
    report_svc_url = string
    nats_emailer_subject = string
    auto_analyze_url = string
    nats_cluster_id = string
    solr_base_url = string
    colin_svc_url = string
  })
  description = "Test job container environment variables"

  default = {
    nats_client_name = "namex.worker"
    nats_nr_state_subject = "namerequest.state"
    solr_base_url = "http://solr-dev.f2b77c-dev.svc:8983"
    nro_extractor_uri = "https://namex-api-dev.apps.silver.devops.gov.bc.ca/api/v1/nro-extract/nro-requests"
    solr_synonyms_api_url = "http://solr-synonyms-api-dev.f2b77c-dev.svc:8080/api/v1"
    nats_servers = "nats://nats-streaming-dev.d893f6-dev.svc:4222"
    nats_queue = "namerequest-processor"
    auto_analyze_config = "WELL_FORMED_NAME"
    report_svc_url = "https://report-api-dev.apps.silver.devops.gov.bc.ca/api/v1/reports"
    nats_emailer_subject = "entity.email"
    auto_analyze_url = "http://auto-analyze-dev.f2b77c-dev.svc:8080"
    nats_cluster_id = "test-cluster"
    colin_svc_url = "http://colin-api-dev.f2b77c-dev.svc:8080/api/v1"
    solr_base_url = "http://solr-dev.f2b77c-dev.svc:8983"
  }
}

variable "region" {
    default = "us-west2"
}

variable "github_repository" {
    default = "registry-jobs"
}

variable "github_owner" {
    default = "bolyachevets"
}

variable "github_branch" {
    default = "^main$"
}
