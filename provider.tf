provider "aws" {
  region = var.region
  alias  = "primary"
}

provider "aws" {
  region = var.backup_region
  alias  = "backup"
}


terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "5.35.0"
    }
  }
}
