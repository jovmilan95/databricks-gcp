variable "databricks_account_id" {
  type        = string
  description = "Databricks Account ID"
}

variable "prefix" {
  type        = string
  description = "Prefix to use in generated VPC name"
}

variable "workspace_name" {
  type        = string
  description = "Name of the workspace to create"
}

