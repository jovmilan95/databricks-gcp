resource "random_pet" "pet" {
  length = 1
  prefix = "${var.env}-${var.project}"
}