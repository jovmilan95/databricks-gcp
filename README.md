# databricks-gcp

**About the Project:**
- The project has 3 Terraform environments, each mapped to a new path `env/env_name` in the GCP bucket.

**Steps to Start the Project:**

**Prerequisites:**
1. **Create a Service Account for Terraform:**
   - Create a Service Account for Terraform.
   - Set the JSON content of this Service Account to the `GOOGLE_CREDENTIALS` secret variable.
   - Ensure this Service Account has an editor role and the ability to store data in the remote state bucket.

1. **Create Users for Workspace Administration:**
   - Visit [Databricks GCP Console](https://accounts.gcp.databricks.com/users).
   - Manually create 3 users for each environment with email addresses in the format `<prefix>-workspace-admin@<project-id>.iam.gserviceaccount.com`.
   - Assign admin privileges to these users.
   - Note: The prefix is defined in `terraform/environment/<env_name>/terraform.tfvars`.

1. **Update Delegate From Variable in GitHub Actions:**

    - Replace the delegate_from variable in the file `terraform/environment/<env_name>/terraform.tfvars` to point to the service account used in GitHub Actions.

4. **Change Bucket Name in GitHub Action:**
   - Replace the bucket name used for remote in the GitHub Actions.
   