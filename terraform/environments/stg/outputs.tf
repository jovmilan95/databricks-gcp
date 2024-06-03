
output "databricks_host" {
  value = module.workspace.databricks_host
}

output "databricks_token" {
  value     = module.workspace.databricks_token
  sensitive = true
}

output "nodebook_url" {
  value = module.notebook.notebook_url
}
