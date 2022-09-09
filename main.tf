terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.18.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "hugolopes-remote-state"
    storage_account_name = "hugoremotestatestorage"
    container_name       = "hugoremotestatecontainer"
    key                  = "pipeline-github-actions/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "hugolopes-remote-state"
    storage_account_name = "hugoremotestatestorage"
    container_name       = "hugoremotestatecontainer"
    key                  = "azure-vnet/terraform.tfstate"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "hugovallada"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "hugolopes-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}
