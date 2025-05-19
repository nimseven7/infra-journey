variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "af-south-1"
}

variable "gandi_personal_access_token" {
  description = "Gandi personal access token for domain management"
  type        = string
  sensitive   = true
}

variable "vianeo_cloudflare_api_token" {
  description = "Cloudflare API token for Vianeo"
  type        = string
  sensitive   = true

}

variable "domain_provider" {
  description = "The domain provider to use (gandi or cloudflare)"
  type        = string
  default     = "gandi"
}

variable "domain_name" {
  description = "The domain name to use for the application"
  type        = string
  default     = "nimseven.dev"
}

variable "domain_zone_id" {
  description = "The domain zone ID in case cloudflare is selected as the provider"
  type        = string
  default     = null

}