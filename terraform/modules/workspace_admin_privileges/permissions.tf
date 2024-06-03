resource "databricks_user" "existing_user" {
  user_name = var.user_name
}

data "databricks_group" "admins" {
  display_name = "admins"
}

resource "databricks_group_member" "admin_user" {
  group_id = data.databricks_group.admins.id
  member_id  = databricks_user.existing_user.id
}