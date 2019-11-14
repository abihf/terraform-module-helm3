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
    command     = "helm upgrade -n '${var.namespace}' --install --values - --version='${var.chart_version}' '${var.release}' '${var.chart}' <<ENDVALUES\n${local.values}\nENDVALUES"
    environment = var.environment_variables
  }
}
