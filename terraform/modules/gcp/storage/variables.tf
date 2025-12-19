variable "bucket_name" {
  type        = string
  default     = ""
  description = "Name of the GCS bucket"
}
variable "bucket_location" {
  type        = string
  default     = "US"
  description = "Location of the GCS bucket"
}
variable "bucket_force_destroy" {
  type        = bool
  default     = true
  description = "Force destroy the GCS bucket"
}
variable "bucket_lifecycle_action_type" {
  type        = string
  default     = "Delete"
  description = "Lifecycle action type for the GCS bucket"
}
variable "bucket_lifecycle_condition_days_since_noncurrent_time" {
  type        = number
default     = 3
  description = "Days since noncurrent time for lifecycle condition"
}
variable "bucket_lifecycle_condition_send_age_if_zero" {
  type        = bool
  default     = false
  description = "Send age if zero for lifecycle condition"
}   