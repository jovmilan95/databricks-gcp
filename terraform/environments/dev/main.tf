locals {
  env = "dev"
}

provider "google" {
  project = var.project
}


module "pet" {
  source  = "../../modules/pet"
  project = var.project
  env     = local.env
}

# module "databricks" {
#   source  = "../../modules/databricks"
# }

