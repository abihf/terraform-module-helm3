variable "chart" {
  description = "Chart name"
  type        = string
}

variable "chart_version" {
  description = "Chart version"
  type        = string
}

variable "release" {
  description = "Name of the release"
  type        = string
}

variable "values" {
  description = "Values to supply the Chart"
  default     = {}
}

variable "namespace" {
  description = "Kubernetes namespace"
  default     = "default"
}


variable "environment_variables" {
  description = "environment variable when running helm"
  default     = {}
}
