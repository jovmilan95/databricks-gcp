locals {
  env = "stg"
}

provider "google" {
  project = "${var.project}"
}

module "pet" {
  source  = "../../modules/pet"
  project = "${var.project}"
  env     = "${local.env}"
}