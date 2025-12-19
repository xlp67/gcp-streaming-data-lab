resource "google_storage_bucket" "this" {
  name = var.bucket_name

  location                    = var.bucket_location
  force_destroy               = var.bucket_force_destroy
  uniform_bucket_level_access = true

  lifecycle_rule {
    action {
      type = var.bucket_lifecycle_action_type
    }
    condition {
      days_since_noncurrent_time = var.bucket_lifecycle_condition_days_since_noncurrent_time
      send_age_if_zero           = var.bucket_lifecycle_condition_send_age_if_zero
    }
  }
}

resource "google_storage_managed_folder" "folder" {
  bucket        = google_storage_bucket.this.name
  name          = "templates/"
  force_destroy = true
  depends_on    = [google_storage_bucket.this]
}

resource "google_storage_bucket_object" "this" {
  name       = "templates/google_dataflow_flex_template_job.json"
  source     = "${path.module}/google_dataflow_flex_template_job.json"
  bucket     = google_storage_bucket.this.name
  depends_on = [google_storage_managed_folder.folder]
}


