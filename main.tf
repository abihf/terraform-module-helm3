locals {
  values = yamlencode(var.values)
}

resource "null_resource" "chart" {
  triggers = {
    chart       = var.chart
    version     = var.chart_version
    release     = var.release
    namespace   = var.namespace
    environment = md5(jsonencode(var.environment_variables))
    values      = md5(local.values)
  }

  provisioner "local-exec" {
    command     = "helm upgrade -n '${var.namespace}' --install --values - --version='${var.chart_version}' '${var.release}' '${var.chart}' << 'EOF'\n${local.values}\nEOF"
    environment = var.environment_variables
  }

  provisioner "local-exec" {
    when        = "destroy"
    command     = "helm uninstall -n '${var.namespace}' '${var.release}'"
    environment = var.environment_variables
  }
}
