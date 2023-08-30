variable "project_id" {
  description = "The ID of the project in which resources will be managed."
  type        = string
}

variable "dataset_name" {
  description = "Name of the BigQuery dataset."
  type        = string
}

variable "sink_name" {
  description = "Name of the logging sink."
  type        = string
}

variable "region" {
  description = "The region in which resources will be managed."
  type        = string
}

variable "log_types" {
  description = "Map of log types to be routed to different datasets"
  type        = map(string)
}