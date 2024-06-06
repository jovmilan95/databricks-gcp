
resource "random_pet" "pet" {
  prefix = terraform.workspace
}

output "name" {
  value = random_pet.pet
}
