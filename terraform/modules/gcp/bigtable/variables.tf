variable "bigtable_instance_name" {
  type        = string
  default     = ""
  description = "Name of the Bigtable instance"
}
variable "bigtable_cluster_id" {
  type        = string
  default     = ""
  description = "ID of the Bigtable cluster"
}
variable "bigtable_zone" {
  type        = string
  default     = ""
  description = "Zone of the Bigtable cluster"
}
variable "bigtable_num_nodes" {
  type        = number
  default     = 1
  description = "Number of nodes in the Bigtable cluster"
}
variable "bigtable_storage_type" {
  type        = string
  default     = "HDD"
  description = "Storage type of the Bigtable cluster"
}
variable "bigtable_prevent_destroy" {
  type        = bool
  default     = false
  description = "Prevent destruction of Bigtable resources"
}
variable "bigtable_table_name" {
  type        = string
  default     = ""
  description = "Name of the Bigtable table"
}
variable "column_family" {
  type        = string
  default     = "cf_info"
  description = "Name of the first column family"
}

variable "bigtable_table_change_stream_retention" {
  type        = string
  default     = "48h"
  description = "Change stream retention duration for the Bigtable table"
}
variable "bigtable_table_automated_backup_policy_retention_period" {
  type        = string
  default     = "72h"
  description = "Retention period for automated backups of the Bigtable table"
}
variable "bigtable_table_automated_backup_policy_frequency" {
  type        = string
  default     = "24h"
  description = "Frequency of automated backups for the Bigtable table"
}
