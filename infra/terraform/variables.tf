variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "af-south-1"
}

variable "gandi_personal_access_token" {
  description = "Gandi personal access token for domain management"
  type        = string
  sensitive   = true
}