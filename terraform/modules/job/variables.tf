variable "job_name" {
  description = "A name for the job."
  type        = string
}

variable "task_key" {
  description = "A name for the task."
  type        = string
}

variable "email_notifications_on_success" {
    description = "List of email addresses to receive notifications upon successful process completion."
    type = list(string)
}

variable "email_notifications_on_failure" {
    description = "List of email addresses to receive notifications upon failure process completion."
    type = list(string)
}

variable "existing_cluster_id" {
    description = ""
    type = string
}

variable "notebook_path" {
    description = ""
    type = string
}