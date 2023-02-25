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
