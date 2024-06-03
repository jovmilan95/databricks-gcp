
resource "databricks_job" "this" {
  name = var.job_name
  task {
    task_key = var.task_key
    existing_cluster_id = var.existing_cluster_id
    notebook_task {
      notebook_path = var.notebook_path
    }
  }
  email_notifications {
    on_success = var.email_notifications_on_success
    on_failure = var.email_notifications_on_failure
  }
}
