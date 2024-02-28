# Configure the connectivity resources settings.
locals {
  configure_connectivity_resources = {
    settings = {
      hub_networks = [
        {
          enabled = true
          config = {
            address_space                = ["10.100.0.0/16", ]
            location                     = var.connectivity_resources_location
            link_to_ddos_protection_plan = false
            dns_servers                  = []
            bgp_community                = ""
            subnets                      = []
            virtual_network_gateway = {
              enabled = false
              config = {
                address_prefix           = "10.100.1.0/24"
                gateway_sku_expressroute = ""
                gateway_sku_vpn          = "VpnGw2"
                advanced_vpn_settings = {
                  enable_bgp                       = null
                  active_active                    = null
                  private_ip_address_allocation    = ""
                  default_local_network_gateway_id = ""
                  vpn_client_configuration         = []
                  bgp_settings                     = []
                  custom_route                     = []
                }
              }
            }
            azure_firewall = {
              enabled = false
              config = {
                address_prefix                = "10.100.0.0/24"
                enable_dns_proxy              = true
                dns_servers                   = []
                sku_tier                      = ""
                base_policy_id                = ""
                private_ip_ranges             = []
                threat_intelligence_mode      = ""
                threat_intelligence_allowlist = []
                availability_zones = {
                  zone_1 = true
                  zone_2 = true
                  zone_3 = true
                }
              }
            }
            spoke_virtual_network_resource_ids      = []
            enable_outbound_virtual_network_peering = true
            enable_hub_network_mesh_peering         = false
          }
        }
      ]
      vwan_hub_networks = []
      ddos_protection_plan = {
        enabled = false
        config = {
          location = var.connectivity_resources_location
        }
      }
      dns = {
        enabled = true
        config = {
          location = null
          enable_private_link_by_service = {
            azure_api_management                 = true
            azure_app_configuration_stores       = true
            azure_arc                            = true
            azure_automation_dscandhybridworker  = true
            azure_automation_webhook             = true
            azure_backup                         = true
            azure_batch_account                  = true
            azure_bot_service_bot                = true
            azure_bot_service_token              = true
            azure_cache_for_redis                = true
            azure_cache_for_redis_enterprise     = true
            azure_container_registry             = true
            azure_cosmos_db_cassandra            = true
            azure_cosmos_db_gremlin              = true
            azure_cosmos_db_mongodb              = true
            azure_cosmos_db_sql                  = true
            azure_cosmos_db_table                = true
            azure_data_explorer                  = true
            azure_data_factory                   = true
            azure_data_factory_portal            = true
            azure_data_health_data_services      = true
            azure_data_lake_file_system_gen2     = true
            azure_database_for_mariadb_server    = true
            azure_database_for_mysql_server      = true
            azure_database_for_postgresql_server = true
            azure_digital_twins                  = true
            azure_event_grid_domain              = true
            azure_event_grid_topic               = true
            azure_event_hubs_namespace           = true
            azure_file_sync                      = true
            azure_hdinsights                     = true
            azure_iot_dps                        = true
            azure_iot_hub                        = true
            azure_key_vault                      = true
            azure_key_vault_managed_hsm          = true
            azure_kubernetes_service_management  = true
            azure_machine_learning_workspace     = true
            azure_managed_disks                  = true
            azure_media_services                 = true
            azure_migrate                        = true
            azure_monitor                        = true
            azure_purview_account                = true
            azure_purview_studio                 = true
            azure_relay_namespace                = true
            azure_search_service                 = true
            azure_service_bus_namespace          = true
            azure_site_recovery                  = true
            azure_sql_database_sqlserver         = true
            azure_synapse_analytics_dev          = true
            azure_synapse_analytics_sql          = true
            azure_synapse_studio                 = true
            azure_web_apps_sites                 = true
            azure_web_apps_static_sites          = true
            cognitive_services_account           = true
            microsoft_power_bi                   = true
            signalr                              = true
            signalr_webpubsub                    = true
            storage_account_blob                 = true
            storage_account_file                 = true
            storage_account_queue                = true
            storage_account_table                = true
            storage_account_web                  = true
          }
          private_link_locations = [
            var.connectivity_resources_location
          ]
          public_dns_zones                                       = []
          private_dns_zones                                      = []
          enable_private_dns_zone_virtual_network_link_on_hubs   = true
          enable_private_dns_zone_virtual_network_link_on_spokes = true
          virtual_network_resource_ids_to_link                   = []
        }
      }
    }

    location = var.connectivity_resources_location
    tags     = null
    advanced = {
      custom_settings_by_resource_type = {
        azurerm_resource_group = {
          connectivity = {
          (var.connectivity_resources_location) = {
            name = "rg-connectivity-001"
          }
        }
          dns = {
            (var.connectivity_resources_location) = {
              name = "rg-dns-001"
            }
          }
        }
        azurerm_firewall_policy = {
          connectivity = {
            (var.connectivity_resources_location) = {
              name = "firewall-policy-001"
            }
          }
        }
        azurerm_virtual_network_gateway = {
          connectivity_expressroute = {
            (var.connectivity_resources_location) = {
              name = "ergw-gateway-001"
          }
        }
        connectivity_vpn = {
          (var.connectivity_resources_location) = {
            name = "vpn-gateway-001"
            }
          }
        }
        azurerm_virtual_network = {
          connectivity = {
            (var.connectivity_resources_location) = {
              name = "virtual-network-001"
            }
          }
        }
        azurerm_firewall = {
          connectivity = {
            (var.connectivity_resources_location) = {
              name = "firewall-001"
            }
          }
        }
        azurerm_public_ip = {
          connectivity_vpn = {
            (var.connectivity_resources_location) = {
              name = "pip-vpn-gateway-001"
            }
          }
        }
        azurerm_public_ip = {
          connectivity_firewall = {
            (var.connectivity_resources_location) = {
              name = "pip-firewall-001"
            }
          }
        }
      }
    }
  }
}

/*              ip_configuration = [
                {
                  name                          = "firewall-pip-001"
#                  public_ip_address_id          = ""
#                  private_ip_address_allocation = ""
#                  subnet_id                     = ""
                } # repeat this block in the list if multiple ip_configuration entries are needed
              ]
*/

/*
        azurerm_virtual_network_gateway = {
          expressroute = {
            (var.location) = {
              name = "expressroute-gateway"
            }
          },
          vpn = {
            (var.connectivity_resources_location) = {
              name = "vpn-gateway-001"
            }
          }
        }
*/

/*            ip_configuration = [
                {
                  name                          = "vpn-gateway-pip-001"
#                  public_ip_address_id          = ""
#                  private_ip_address_allocation = ""
#                  subnet_id                     = ""
                } # repeat this block in the list if multiple ip_configuration entries are needed
              ]
*/