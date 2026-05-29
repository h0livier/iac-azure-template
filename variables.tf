variable "environment" {
  description = "The environment for the resources"
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be dev, test or prod"
  }
}