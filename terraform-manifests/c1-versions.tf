# Terraform Block
terraform {
  required_version = "~> 1.12.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.2.0"
    }    
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }            
  }
  # Adding Backend as s3 for Remote State Storage
  backend "s3" {}
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  #profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}