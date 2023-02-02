# TODO recreate secrets from terraform vars: https://www.sethvargo.com/managing_google_secret_manager_secrets_with_terraform/
resource "google_cloud_run_v2_job" "test_gcp_job" {
  name     = var.test_job.name
  location = var.region
  launch_stage = "BETA"

  template {
    template {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.environment.project_id}/${var.test_job.image}:dev"

        env {
          name = "NATS_CLIENT_NAME"
          value = var.test_job_container_env.nats_client_name
        }
        env {
          name = "NATS_NR_STATE_SUBJECT"
          value = var.test_job_container_env.nats_nr_state_subject
        }
        env {
          name = "SOLR_BASE_URL"
          value = var.test_job_container_env.solr_base_url
        }
        env {
          name = "NRO_EXTRACTOR_URI"
          value = var.test_job_container_env.nro_extractor_uri
        }
        env {
          name = "SOLR_SYNONYMS_API_URL"
          value = var.test_job_container_env.solr_synonyms_api_url
        }
        env {
          name = "NATS_SERVERS"
          value = var.test_job_container_env.nats_servers
        }
        env {
          name = "NATS_QUEUE"
          value = var.test_job_container_env.nats_queue
        }
        env {
          name = "AUTO_ANALYZE_CONFIG"
          value = var.test_job_container_env.auto_analyze_config
        }
        env {
          name = "REPORT_SVC_URL"
          value = var.test_job_container_env.report_svc_url
        }
        env {
          name = "NATS_EMAILER_SUBJECT"
          value = var.test_job_container_env.nats_emailer_subject
        }
        env {
          name = "AUTO_ANALYZE_URL"
          value = var.test_job_container_env.auto_analyze_url
        }
        env {
          name = "NATS_CLUSTER_ID"
          value = var.test_job_container_env.nats_cluster_id
        }
        env {
          name = "COLIN_SVC_URL"
          value = var.test_job_container_env.colin_svc_url
        }
        env {
          name = "OC_TOKEN"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_token.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_NAME"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.database_name.secret
              version = "1"
            }
          }
        }
        env {
          name = "OC_SELECTOR"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_selector.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_HOST"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.database_host.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_PORT"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.database_port.secret
              version = "1"
            }
          }
        }
        env {
          name = "SECRET_KEY"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.secret_key.secret
              version = "1"
            }
          }
        }
        env {
          name = "OC_NAMESPACE"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_namespace.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_USERNAME"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.database_username.secret
              version = "1"
            }
          }
        }
        env {
          name = "OC_SERVER"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_server.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_PASSWORD"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.database_password.secret
              version = "1"
            }
          }
        }
      }
    }
  }
}
