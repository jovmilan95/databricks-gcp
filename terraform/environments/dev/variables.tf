variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "google_project" {
  type        = string
  description = "Google project for VCP/workspace deployment"
}

variable "google_region" {
  type        = string
  description = "Google region for VCP/workspace deployment"
}

variable "google_zone" {
  description = "Zone in GCP region"
  type        = string
}

variable "prefix" {
  type        = string
  description = "Prefix to use in generated names"
}

variable "workspace_name" {
  description = "Name of the workspace to create"
  type        = string
}

variable "workspace_admin_privileges" {
  description = "Set of user that have authorized access to the created workspace."
  type        = set(string)
}
variable "delegate_from" {
  description = "Identities to allow to impersonate created service account (in form of user:user.name@example.com, group:deployers@example.com or serviceAccount:sa1@project.iam.gserviceaccount.com)"
  type        = list(string)
}

variable "host" {
  description = "The URL endpoint for the Databricks accounts API on Google Cloud Platform (GCP)."
  type        = string
  default     = "https://accounts.gcp.databricks.com"
}

variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform"
}

variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
}

variable "cluster_autotermination_minutes" {
  description = "How many minutes before automatically terminating due to inactivity."
  type        = number
}

variable "cluster_num_workers" {
  description = "The number of workers."
  type        = number
}

variable "email_notifications_on_success" {
  description = "List of email addresses to receive notifications upon successful process completion."
  type        = list(string)
}

variable "email_notifications_on_failure" {
  description = "List of email addresses to receive notifications upon failure process completion."
  type        = list(string)
}
