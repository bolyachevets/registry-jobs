resource "google_cloud_run_v2_job" "test_gcp_job" {
  name     = var.test_job.name
  location = var.region
  launch_stage = "BETA"

  template {
    template {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.environment.project_id}/${var.test_job.registry_repo}/${var.test_job.image}:${var.test_job.tag}"

        env {
          name = "NRO_EXTRACTOR_URI"
          value = var.nro_extractor_uri
        }
        env {
          name = "NATS_CLIENT_NAME"
          value = local.nats_client_name
        }
        env {
          name = "NATS_NR_STATE_SUBJECT"
          value = local.nats_nr_state_subject
        }
        env {
          name = "SOLR_BASE_URL"
          value = local.solr_base_url
        }
        env {
          name = "SOLR_SYNONYMS_API_URL"
          value = local.solr_synonyms_api_url
        }
        env {
          name = "NATS_SERVERS"
          value = local.nats_servers
        }
        env {
          name = "NATS_QUEUE"
          value = local.nats_queue
        }
        env {
          name = "AUTO_ANALYZE_CONFIG"
          value = local.auto_analyze_config
        }
        env {
          name = "REPORT_SVC_URL"
          value = local.report_svc_url
        }
        env {
          name = "NATS_EMAILER_SUBJECT"
          value = local.nats_emailer_subject
        }
        env {
          name = "AUTO_ANALYZE_URL"
          value = local.auto_analyze_url
        }
        env {
          name = "NATS_CLUSTER_ID"
          value = local.nats_cluster_id
        }
        env {
          name = "COLIN_SVC_URL"
          value = "${local.colin_svc_url}${local.colin_svc_version}"
        }
        env {
          name = "DATABASE_HOST"
          value = var.db_connection.host
        }
        env {
          name = "DATABASE_PORT"
          value = var.db_connection.port
        }

        env {
          name = "DATABASE_USERNAME"
          value_source {
            secret_key_ref {
              secret = google_secret_manager_secret_version.database_username_version.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_PASSWORD"
          value_source {
            secret_key_ref {
              secret = google_secret_manager_secret_version.database_password_version.secret
              version = "1"
            }
          }
        }
        env {
          name = "DATABASE_NAME"
          value_source {
            secret_key_ref {
              secret = google_secret_manager_secret_version.database_name_version.secret
              version = "1"
            }
          }
        }
        env {
          name = "SECRET_KEY"
          value_source {
            secret_key_ref {
              secret = google_secret_manager_secret_version.secret_key_version.secret
              version = "1"
            }
          }
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
          name = "OC_SELECTOR"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_selector.secret
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
          name = "OC_NAMESPACE"
          value_source {
            secret_key_ref {
              secret = data.google_secret_manager_secret_version.oc_namespace.secret
              version = "1"
            }
          }
        }
      }
    }
  }
}
