output "pubsub_topic_id" {
  value = google_pubsub_topic.this.name
}
output "pubsub_subscription_id" {
  value = google_pubsub_subscription.this.id
}
