provider "aws" {
  region = "us-east-1"
  
  # Terraform will ONLY run if it matches this ID
  allowed_account_ids = ["525987623219"] 
}

terraform {
  required_version = ">= 1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
}