resource "google_service_account" "service_account" {
  account_id   = "bigquery-access-sa"
  project      = var.project_id
  display_name = "Service Account for BigQuery access"
}

resource "google_project_iam_member" "bq_sa_data_editor" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "bq_sa_job_user" {
  project = var.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = google_service_account.service_account.name
  key_algorithm      = "KEY_ALG_RSA_2048"
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

resource "google_project_iam_member" "sa_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "sa_cloudbuild_editor" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.editor"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "sa_artifactregistry_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "sa_serviceusage_consumer" {
  project = var.project_id
  role    = "roles/serviceusage.serviceUsageConsumer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "sa_iam_service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "local_file" "sa_key_file" {
  content  = base64decode(google_service_account_key.service_account_key.private_key)
  filename = "../config/credentials.json"
}

# ---------------- STORAGE --------------------
resource "google_service_account" "service_account_storage" {
  account_id   = "storage-access-sa"
  project      = var.project_id
  display_name = "Service Account for Storage access"
}

resource "google_project_iam_member" "storage_sa_admin" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.service_account_storage.email}"
}
