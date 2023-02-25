data "google_secret_manager_secret_version" "oc_token" {
  secret  = "projects/366678529892/secrets/OC_TOKEN"
}

data "google_secret_manager_secret_version" "oc_selector" {
  secret  = "projects/366678529892/secrets/OC_SELECTOR"
}

data "google_secret_manager_secret_version" "secret_key" {
  secret  = "projects/366678529892/secrets/OC_SELECTOR"
}

data "google_secret_manager_secret_version" "oc_namespace" {
  secret  = "projects/366678529892/secrets/OC_NAMESPACE"
}

data "google_secret_manager_secret_version" "oc_server" {
  secret  = "projects/366678529892/secrets/OC_SERVER"
}

resource "google_secret_manager_secret" "database_username" {
  secret_id = "DB_USERNAME"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "database_username_version" {
  secret = google_secret_manager_secret.database_username.id
  secret_data = local.db_username
}

resource "google_secret_manager_secret" "database_name" {
  secret_id = "DB_NAME"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "database_name_version" {
  secret = google_secret_manager_secret.database_name.id
  secret_data = local.db_name
}

resource "google_secret_manager_secret" "database_password" {
  secret_id = "DB_PASSWORD"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "database_password_version" {
  secret = google_secret_manager_secret.database_password.id
  secret_data = local.db_password
}

resource "google_secret_manager_secret" "secret_key" {
  secret_id = "SECRET_KEY"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret_key_version" {
  secret = google_secret_manager_secret.secret_key.id
  secret_data = local.secret_key
}
