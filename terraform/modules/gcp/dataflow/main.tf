resource "google_dataflow_flex_template_job" "big_data_job" {
  project                      = var.project_id
  provider                     = google-beta
  name                         = var.dataflow_flex_template_job_name
  region                       = var.region
  container_spec_gcs_path      = "gs://${var.bucket_name}/templates/google_dataflow_flex_template_job.json"
  skip_wait_on_job_termination = true
}
