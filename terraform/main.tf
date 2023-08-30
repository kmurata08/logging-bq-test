resource "google_bigquery_dataset" "dataset" {
  for_each = var.log_types

  dataset_id = each.value
  friendly_name = each.key
  description = "Dataset for user action ${each.key} logs"
}

resource "google_logging_project_sink" "log_sink" {
  for_each = var.log_types

  name        = "sink_for_${each.value}"
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.dataset[each.key].dataset_id}"
  filter      = "logName=\"projects/${var.project_id}/logs/action_log\" AND jsonPayload.type=\"${each.key}\""
  unique_writer_identity = true
}