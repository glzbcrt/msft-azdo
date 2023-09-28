terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

resource "azuredevops_project" "devops" {
  name       = "DevOps"  
}

resource "azuredevops_project" "dataops" {
  name       = "dataops"  
}