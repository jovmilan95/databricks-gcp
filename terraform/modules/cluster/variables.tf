variable "cluster_name" {
  description = "A name for the cluster."
  type        = string
}

variable "cluster_autotermination_minutes" {
  description = "How many minutes before automatically terminating due to inactivity."
  type        = number
}

variable "cluster_num_workers" {
  description = "The number of workers."
  type        = number
}