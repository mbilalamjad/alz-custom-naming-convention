# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used.

# Map each module provider to their corresponding `azurerm` provider using the providers input object

module "caf-enterprise-scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "4.0.2" #UPDATE THE MODULE VERSION TO LATEST. CHECK HERE FOR LATEST VERSION https://registry.terraform.io/modules/Azure/caf-enterprise-scale/azurerm/latest

  default_location = var.default_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_core_landing_zones = var.deploy_core_landing_zones
  deploy_corp_landing_zones = var.deploy_corp_landing_zones
  deploy_online_landing_zones = var.deploy_online_landing_zones
  deploy_identity_resources = var.deploy_identity_resources
  deploy_management_resources = var.deploy_management_resources
  deploy_connectivity_resources = var.deploy_connectivity_resources

  subscription_id_connectivity  = data.azurerm_client_config.connectivity.subscription_id
  subscription_id_identity  = data.azurerm_client_config.identity.subscription_id
  subscription_id_management  = data.azurerm_client_config.management.subscription_id

  configure_identity_resources = local.configure_identity_resources  
  configure_management_resources = local.configure_management_resources
  configure_connectivity_resources = local.configure_connectivity_resources

  custom_landing_zones = {
    (var.root_id) = {
      display_name               = "${upper(var.root_id)}"
      parent_management_group_id = "${var.tenant_id}"
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_root"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-decommissioned" = {
      display_name               = "Mg-Decommissioned-001"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_decommissioned"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-sandbox" = {
      display_name               = "Mg-Sandbox-001"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-business-apps" = {
      display_name               = "Mg-Business-Applications-001"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_landing_zones"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-infra-services" = {
      display_name               = "Mg-Infrastructure-Services-001"
      parent_management_group_id = var.root_id
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_platform"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-connectivity" = {
      display_name               = "Mg-Connectivity-001"
      parent_management_group_id = "${var.root_id}-infra-services"
      subscription_ids           = [
        "${var.subscription_id_connectivity}",
      ]
      archetype_config           = {
        archetype_id   = "es_connectivity"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-management" = {
      display_name               = "Mg-Management-001"
      parent_management_group_id = "${var.root_id}-infra-services"
      subscription_ids           = [
        "${var.subscription_id_management}",
      ]
      archetype_config           = {
        archetype_id   = "es_management"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-identity" = {
      display_name               = "Mg-Identity-001"
      parent_management_group_id = "${var.root_id}-infra-services"
      subscription_ids           = [
        "${var.subscription_id_identity}",
      ]
      archetype_config           = {
        archetype_id   = "es_identity"
        parameters     = {}
        access_control = {}
      }
    }

/*
    "${var.root_id}-security" = {
      display_name               = "Mg-Security-001"
      parent_management_group_id = "${var.root_id}-infra-services"
      subscription_ids           = [
        "${var.securitySubscriptionId}",
      ]
      archetype_config           = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
*/
    "${var.root_id}-corp" = {
      display_name               = "Mg-Corp-001"
      parent_management_group_id = "${var.root_id}-business-apps"
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_corp"
        parameters     = {}
        access_control = {}
      }
    }

    "${var.root_id}-online" = {
      display_name               = "Mg-Online-001"
      parent_management_group_id = "${var.root_id}-business-apps"
      subscription_ids           = []
      archetype_config           = {
        archetype_id   = "es_online"
        parameters     = {}
        access_control = {}
      }
    }
  }

}