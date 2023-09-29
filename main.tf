terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

resource "azuredevops_project" "dataops" {
  name               = "dataops"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  description        = "Assets used by the DataOps pipelines."
}

# Create a shared service connection to be used by several DataOps projects.
# It is not shared yet. It seems the Terraform provider does not support it.
resource "azuredevops_serviceendpoint_azurerm" "dev" {
  project_id                              = azuredevops_project.dataops.id
  service_endpoint_name                   = "dev"
  service_endpoint_authentication_scheme  = "ServicePrincipal"
  azurerm_spn_tenantid                    = var.tenantId
  azurerm_subscription_id                 = var.subscriptionId
  azurerm_subscription_name               = var.subscriptionName

  credentials {
    serviceprincipalid  = var.principalId
    serviceprincipalkey = var.principalKey
  }  
}
