resource "google_pubsub_topic" "this" {
  name = var.pubsub_topic_id
  labels = {
    environment = "dev"
  }
}

resource "google_pubsub_subscription" "this" {
  name                 = var.pubsub_subscription_id
  topic                = google_pubsub_topic.this.id
  ack_deadline_seconds = 20
}
