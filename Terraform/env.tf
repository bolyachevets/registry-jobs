data "google_secret_manager_secret_version" "oc_token" {
  secret  = "projects/366678529892/secrets/OC_TOKEN"
}

data "google_secret_manager_secret_version" "database_name" {
  secret  = "projects/366678529892/secrets/DATABASE_NAME"
}

data "google_secret_manager_secret_version" "oc_selector" {
  secret  = "projects/366678529892/secrets/OC_SELECTOR"
}

data "google_secret_manager_secret_version" "database_host" {
  secret  = "projects/366678529892/secrets/DATABASE_HOST"
}

data "google_secret_manager_secret_version" "database_port" {
  secret  = "projects/366678529892/secrets/DATABASE_PORT"
}

data "google_secret_manager_secret_version" "secret_key" {
  secret  = "projects/366678529892/secrets/OC_SELECTOR"
}

data "google_secret_manager_secret_version" "oc_namespace" {
  secret  = "projects/366678529892/secrets/OC_NAMESPACE"
}

data "google_secret_manager_secret_version" "database_username" {
  secret  = "projects/366678529892/secrets/DATABASE_USERNAME"
}

data "google_secret_manager_secret_version" "oc_server" {
  secret  = "projects/366678529892/secrets/OC_SERVER"
}

data "google_secret_manager_secret_version" "database_password" {
  secret  = "projects/366678529892/secrets/DATABASE_PASSWORD"
}
