resource "google_storage_bucket_object" "metadata_json" {
  name    = "templates/job-${var.image_tag}.json"
  bucket  = "test-bucket-xlp67"
  content = jsonencode({
    "image": "us-central1-docker.pkg.dev/${var.project_id}/dataflow-repo/streaming-beam-job:${var.image_tag}",
    "sdk_info": {"language": "PYTHON"}
  })
}

resource "google_dataflow_flex_template_job" "job" {
  name                    = "streaming-job-${var.image_tag}"
  container_spec_gcs_path = "gs://${google_storage_bucket_object.metadata_json.bucket}/${google_storage_bucket_object.metadata_json.name}"
  depends_on = [google_storage_bucket_object.metadata_json]
}