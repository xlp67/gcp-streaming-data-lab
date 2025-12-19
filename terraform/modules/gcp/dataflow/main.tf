

resource "google_dataflow_flex_template_job" "job" {
  provider                      = google-beta
  region                        = var.region
  name                    = "job_${var.image_tag}"
  container_spec_gcs_path       = var.dataflow_container_spec_gcs_path
  skip_wait_on_job_termination = true
  max_workers                   = 1
  enable_streaming_engine       = true
  parameters = {
    inputSubscription = var.dataflow_subscription_id
  }
}