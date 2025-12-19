resource "google_bigtable_instance" "this" {
  name = var.bigtable_instance_name
  cluster {
    cluster_id   = var.bigtable_cluster_id
    zone         = var.bigtable_zone
    num_nodes    = var.bigtable_num_nodes
    storage_type = var.bigtable_storage_type
  }
  deletion_protection = var.bigtable_prevent_destroy
}

resource "google_bigtable_table" "this" {
  name          = var.bigtable_table_name
  instance_name = google_bigtable_instance.this.name
  split_keys    = ["a", "b", "c"]

  column_family {
    family = var.column_family
  }
  change_stream_retention = null
}
