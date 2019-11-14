Simple Helm Chart application with state managed by Terraform.

That is, run `helm upgrade` and `helm uninstall` via Terraform local-exec.

Caveats:
  - Only support helm 3.0
