resource "databricks_mws_workspaces" "databricks_workspace" {
  account_id     = var.databricks_account_id
  workspace_name = var.workspace_name

  location = data.google_client_config.current.region
  cloud_resource_container {
    gcp {
      project_id = data.google_client_config.current.project
    }
  }
  token {
    comment = "Terraform token"
  }
}

