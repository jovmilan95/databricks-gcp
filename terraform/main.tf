locals {
  notebooks_directory = "../notebooks"
  notebook_files      = fileset(local.notebooks_directory, "*")
}
module "sa-provisioning" {
  source         = "./modules/sa-provisioning"
  google_project = var.google_project
  prefix         = var.prefix
}

resource "time_sleep" "wait_120_seconds" {
  create_duration = "120s"
  depends_on      = [module.sa-provisioning]
}

provider "databricks" {
  alias                  = "accounts"
  host                   = var.host
  google_service_account = module.sa-provisioning.service_account
  account_id             = var.databricks_account_id
}
module "workspace" {
  source                = "./modules/workspace"
  databricks_account_id = var.databricks_account_id
  prefix                = var.prefix
  workspace_name        = var.workspace_name
  depends_on            = [time_sleep.wait_120_seconds]
  providers = {
    databricks = databricks.accounts
  }
}

provider "databricks" {
  alias = "workspace"
  host  = module.workspace.databricks_host
  token = module.workspace.databricks_token
}

resource "time_sleep" "wait_180_seconds" {
  create_duration = "180s"
  depends_on      = [module.workspace]
}


module "notebook" {
  # Commented out for_each block as it's not currently being used
  # for_each = local.notebook_files
  # notebook_path         = "${local.notebooks_directory}/${each.value}"
  source                = "./modules/notebook"
  notebook_subdirectory = var.notebook_subdirectory
  notebook_path         = "${local.notebooks_directory}/notebook-getting-started.py"
  notebook_language     = "PYTHON"
  depends_on            = [module.workspace]
  providers = {
    databricks = databricks.workspace
  }
}

module "workspace_admin_privileges" {
  for_each   = var.workspace_admin_privileges
  source     = "./modules/workspace_admin_privileges"
  user_name  = each.value
  depends_on = [module.workspace]
  providers = {
    databricks = databricks.workspace
  }
}


module "cluster" {
  source                          = "./modules/cluster"
  cluster_name                    = var.cluster_name
  cluster_autotermination_minutes = var.cluster_autotermination_minutes
  cluster_num_workers             = var.cluster_num_workers
  depends_on                      = [time_sleep.wait_180_seconds]
  providers = {
    databricks = databricks.workspace
  }
}

module "job" {
  source                         = "./modules/job"
  job_name                       = "getting-started-job"
  task_key                       = "getting-started-task"
  email_notifications_on_failure = var.email_notifications_on_failure
  email_notifications_on_success = var.email_notifications_on_success
  existing_cluster_id            = module.cluster.cluster_id
  notebook_path                  = "/${module.notebook.notebook_url}"
  providers = {
    databricks = databricks.workspace
  }
}

