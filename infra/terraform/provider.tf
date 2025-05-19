terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    gandi = {
      version = "~> 2.3.0"
      source  = "go-gandi/gandi"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  profile = "iam_admin"

  default_tags {
    tags = {
      managed_by = "Terraform"
      Project    = "my-fastapi"
    }
  }
}

provider "gandi" {
  personal_access_token = var.gandi_personal_access_token
}

provider "cloudflare" {
  api_token = var.vianeo_cloudflare_api_token
}
