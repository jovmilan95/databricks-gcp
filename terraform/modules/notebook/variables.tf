variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform"
}

variable "notebook_path" {
  description = "The notebook's absolute path."
  type        = string
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
}