

resource "databricks_notebook" "this" {
  path     = "/${var.notebook_subdirectory}/${basename(var.notebook_path)}"
  language = var.notebook_language
  source   = "${path.root}/${var.notebook_path}"
}


