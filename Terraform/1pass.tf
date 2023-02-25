# see https://github.com/1Password/terraform-provider-onepassword/issues/72
data "onepassword_vault" "namex" {
  name = "namex"
}

data "onepassword_vault" "nats" {
  name = "nats"
}

data "onepassword_vault" "entity" {
  name = "entity"
}

data "onepassword_vault" "api" {
  name = "api"
}

data "onepassword_item" "nats_env" {
  vault = data.onepassword_vault.nats.uuid
  title = var.test_job.tag
}

data "onepassword_item" "entity_env" {
  vault = data.onepassword_vault.entity.uuid
  title = var.test_job.tag
}

data "onepassword_item" "namex_env" {
  vault = data.onepassword_vault.namex.uuid
  title = var.test_job.tag
}

data "onepassword_item" "api_env" {
  vault = data.onepassword_vault.api.uuid
  title = var.test_job.tag
}

locals {
  nats_client_name = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field.*.label, "nats_client_name")].value
  nats_queue = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field.*.label, "nats_queue")].value
  nats_nr_state_subject = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field.*.label, "nats_nr_state_subject")].value
  nats_emailer_subject = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "namex")].field.*.label, "nats_emailer_subject")].value
  nats_servers = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "base2")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "base2")].field.*.label, "nats_servers")].value
  nats_cluster_id = data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "base2")].field[index(data.onepassword_item.nats_env.section[index(data.onepassword_item.nats_env.section.*.label, "base2")].field.*.label, "nats_cluster_id")].value
  auto_analyze_url = data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field.*.label, "auto_analyze_url")].value
  auto_analyze_config = data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field.*.label, "auto_analyze_config")].value
  solr_base_url = data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field.*.label, "solr_base_url")].value
  solr_synonyms_api_url = data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "auto-analyze2")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "auto-analyze2")].field.*.label, "solr_synonyms_api_url")].value
  report_svc_url = data.onepassword_item.entity_env.section[index(data.onepassword_item.entity_env.section.*.label, "legal-api2")].field[index(data.onepassword_item.entity_env.section[index(data.onepassword_item.entity_env.section.*.label, "legal-api2")].field.*.label, "report_svc_url")].value
  colin_svc_url = data.onepassword_item.api_env.section[index(data.onepassword_item.api_env.section.*.label, "colin-api-namex")].field[index(data.onepassword_item.api_env.section[index(data.onepassword_item.api_env.section.*.label, "colin-api-namex")].field.*.label, "colin_svc_url")].value
  colin_svc_version = data.onepassword_item.api_env.section[index(data.onepassword_item.api_env.section.*.label, "colin-api-namex")].field[index(data.onepassword_item.api_env.section[index(data.onepassword_item.api_env.section.*.label, "colin-api-namex")].field.*.label, "colin_svc_version")].value
  secret_key = sensitive(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "namex-api")].field.*.label, "secret_key")].value)
  db_username = sensitive(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field.*.label, "database_username")].value)
  db_password = sensitive(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field.*.label, "database_password")].value)
  db_name = sensitive(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field[index(data.onepassword_item.namex_env.section[index(data.onepassword_item.namex_env.section.*.label, "postgres-namex")].field.*.label, "database_name")].value)
}
