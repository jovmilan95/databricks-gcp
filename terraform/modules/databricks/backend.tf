terraform {
  backend "gcs" {
    bucket = "databricks-alex-tfstate"
    prefix = "env/dev"
  }
}
