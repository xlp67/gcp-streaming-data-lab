module "iam" {
  source     = "./modules/gcp/iam"
  project_id = var.project_id
}

module "storage_bucket" {
  source                                                = "./modules/gcp/storage"
  bucket_name                                           = "test-bucket-xlp67"
  bucket_location                                       = var.region
  bucket_force_destroy                                  = true
  bucket_lifecycle_action_type                          = "Delete"
  bucket_lifecycle_condition_days_since_noncurrent_time = 3
  bucket_lifecycle_condition_send_age_if_zero           = false
  depends_on                                            = [module.iam]
}

module "pubsub" {
  source                 = "./modules/gcp/pubsub"
  pubsub_topic_id        = "test-topic"
  pubsub_subscription_id = "test-subscription"
}
module "dataflow" {
  source                           = "./modules/gcp/dataflow"
  dataflow_flex_template_job_name  = "test-dataflow-job"
  dataflow_subscription_id         = module.pubsub.pubsub_subscription_id
  region                          = var.region
  image_tag                       = var.image_tag
  dataflow_container_spec_gcs_path = "gs://${module.storage_bucket.bucket_name}/templates/job-${var.image_tag}.json"
}

module "bigtable" {
  source                 = "./modules/gcp/bigtable"
  bigtable_instance_name = "test-instance"
  bigtable_cluster_id    = "test-cluster"
  bigtable_table_name    = "test-table"
  column_family          = "cf1"
  bigtable_zone          = "${var.region}-b"
}
