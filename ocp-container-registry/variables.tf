variable "GOOGLE_CREDENTIALS" {
  type = string
  default = ""
}
variable "environment" {
  type = object({
    project_id     = string
    registry       = string
  })
  description = "GCP project parameters"

  default = {
    project_id      = "c4hnrd-dev"
    registry        = "gcr.io"
  }
}

variable "images" {
  type = list(string)

  description = "images to maintain"

  default = [
    "ubuntu:latest"
  ]
}
