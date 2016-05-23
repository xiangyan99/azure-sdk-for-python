# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

require 'uri'
require 'cgi'
require 'date'
require 'json'
require 'base64'
require 'erb'
require 'securerandom'
require 'time'
require 'timeliness'
require 'faraday'
require 'faraday-cookie_jar'
require 'concurrent'
require 'ms_rest'
require 'azure_mgmt_web/module_definition'
require 'ms_rest_azure'

module Azure::ARM::Web
  autoload :CertificateOrders,                                  'azure_mgmt_web/certificate_orders.rb'
  autoload :Certificates,                                       'azure_mgmt_web/certificates.rb'
  autoload :ClassicMobileServices,                              'azure_mgmt_web/classic_mobile_services.rb'
  autoload :Domains,                                            'azure_mgmt_web/domains.rb'
  autoload :Global,                                             'azure_mgmt_web/global.rb'
  autoload :GlobalCertificateOrder,                             'azure_mgmt_web/global_certificate_order.rb'
  autoload :GlobalDomainRegistration,                           'azure_mgmt_web/global_domain_registration.rb'
  autoload :GlobalResourceGroups,                               'azure_mgmt_web/global_resource_groups.rb'
  autoload :HostingEnvironments,                                'azure_mgmt_web/hosting_environments.rb'
  autoload :ManagedHostingEnvironments,                         'azure_mgmt_web/managed_hosting_environments.rb'
  autoload :Provider,                                           'azure_mgmt_web/provider.rb'
  autoload :Recommendations,                                    'azure_mgmt_web/recommendations.rb'
  autoload :ServerFarms,                                        'azure_mgmt_web/server_farms.rb'
  autoload :Sites,                                              'azure_mgmt_web/sites.rb'
  autoload :TopLevelDomains,                                    'azure_mgmt_web/top_level_domains.rb'
  autoload :UsageOperations,                                    'azure_mgmt_web/usage_operations.rb'
  autoload :WebSiteManagementClient,                            'azure_mgmt_web/web_site_management_client.rb'

  module Models
    autoload :ArmPlan,                                            'azure_mgmt_web/models/arm_plan.rb'
    autoload :CertificateOrderCertificateProperties,              'azure_mgmt_web/models/certificate_order_certificate_properties.rb'
    autoload :SkuDescription,                                     'azure_mgmt_web/models/sku_description.rb'
    autoload :CertificateOrderProperties,                         'azure_mgmt_web/models/certificate_order_properties.rb'
    autoload :CertificateDetailsProperties,                       'azure_mgmt_web/models/certificate_details_properties.rb'
    autoload :CertificateOrderCollection,                         'azure_mgmt_web/models/certificate_order_collection.rb'
    autoload :CertificateOrderCertificateCollection,              'azure_mgmt_web/models/certificate_order_certificate_collection.rb'
    autoload :ReissueCertificateOrderRequestProperties,           'azure_mgmt_web/models/reissue_certificate_order_request_properties.rb'
    autoload :RenewCertificateOrderRequestProperties,             'azure_mgmt_web/models/renew_certificate_order_request_properties.rb'
    autoload :CertificateOrderActionProperties,                   'azure_mgmt_web/models/certificate_order_action_properties.rb'
    autoload :CertificateEmailProperties,                         'azure_mgmt_web/models/certificate_email_properties.rb'
    autoload :CertificateCollection,                              'azure_mgmt_web/models/certificate_collection.rb'
    autoload :CertificateProperties,                              'azure_mgmt_web/models/certificate_properties.rb'
    autoload :HostingEnvironmentProfile,                          'azure_mgmt_web/models/hosting_environment_profile.rb'
    autoload :CsrProperties,                                      'azure_mgmt_web/models/csr_properties.rb'
    autoload :ClassicMobileServiceCollection,                     'azure_mgmt_web/models/classic_mobile_service_collection.rb'
    autoload :ClassicMobileServiceProperties,                     'azure_mgmt_web/models/classic_mobile_service_properties.rb'
    autoload :DomainCollection,                                   'azure_mgmt_web/models/domain_collection.rb'
    autoload :DomainProperties,                                   'azure_mgmt_web/models/domain_properties.rb'
    autoload :Contact,                                            'azure_mgmt_web/models/contact.rb'
    autoload :Address,                                            'azure_mgmt_web/models/address.rb'
    autoload :HostName,                                           'azure_mgmt_web/models/host_name.rb'
    autoload :DomainPurchaseConsent,                              'azure_mgmt_web/models/domain_purchase_consent.rb'
    autoload :UserProperties,                                     'azure_mgmt_web/models/user_properties.rb'
    autoload :GeoRegionCollection,                                'azure_mgmt_web/models/geo_region_collection.rb'
    autoload :GeoRegionProperties,                                'azure_mgmt_web/models/geo_region_properties.rb'
    autoload :ServerFarmCollection,                               'azure_mgmt_web/models/server_farm_collection.rb'
    autoload :ServerFarmWithRichSkuProperties,                    'azure_mgmt_web/models/server_farm_with_rich_sku_properties.rb'
    autoload :SiteCollection,                                     'azure_mgmt_web/models/site_collection.rb'
    autoload :SiteProperties,                                     'azure_mgmt_web/models/site_properties.rb'
    autoload :HostNameSslState,                                   'azure_mgmt_web/models/host_name_ssl_state.rb'
    autoload :SiteConfigProperties,                               'azure_mgmt_web/models/site_config_properties.rb'
    autoload :NameValuePair,                                      'azure_mgmt_web/models/name_value_pair.rb'
    autoload :ConnStringInfo,                                     'azure_mgmt_web/models/conn_string_info.rb'
    autoload :HandlerMapping,                                     'azure_mgmt_web/models/handler_mapping.rb'
    autoload :VirtualApplication,                                 'azure_mgmt_web/models/virtual_application.rb'
    autoload :VirtualDirectory,                                   'azure_mgmt_web/models/virtual_directory.rb'
    autoload :Experiments,                                        'azure_mgmt_web/models/experiments.rb'
    autoload :RampUpRule,                                         'azure_mgmt_web/models/ramp_up_rule.rb'
    autoload :SiteLimits,                                         'azure_mgmt_web/models/site_limits.rb'
    autoload :AutoHealRules,                                      'azure_mgmt_web/models/auto_heal_rules.rb'
    autoload :AutoHealTriggers,                                   'azure_mgmt_web/models/auto_heal_triggers.rb'
    autoload :RequestsBasedTrigger,                               'azure_mgmt_web/models/requests_based_trigger.rb'
    autoload :StatusCodesBasedTrigger,                            'azure_mgmt_web/models/status_codes_based_trigger.rb'
    autoload :SlowRequestsBasedTrigger,                           'azure_mgmt_web/models/slow_requests_based_trigger.rb'
    autoload :AutoHealActions,                                    'azure_mgmt_web/models/auto_heal_actions.rb'
    autoload :AutoHealCustomAction,                               'azure_mgmt_web/models/auto_heal_custom_action.rb'
    autoload :CorsSettings,                                       'azure_mgmt_web/models/cors_settings.rb'
    autoload :ApiDefinitionInfo,                                  'azure_mgmt_web/models/api_definition_info.rb'
    autoload :IpSecurityRestriction,                              'azure_mgmt_web/models/ip_security_restriction.rb'
    autoload :CloningInfo,                                        'azure_mgmt_web/models/cloning_info.rb'
    autoload :RoutingRule,                                        'azure_mgmt_web/models/routing_rule.rb'
    autoload :SiteAuthSettings,                                   'azure_mgmt_web/models/site_auth_settings.rb'
    autoload :HostingEnvironmentCollection,                       'azure_mgmt_web/models/hosting_environment_collection.rb'
    autoload :HostingEnvironmentProperties,                       'azure_mgmt_web/models/hosting_environment_properties.rb'
    autoload :VirtualNetworkProfile,                              'azure_mgmt_web/models/virtual_network_profile.rb'
    autoload :WorkerPoolProperties,                               'azure_mgmt_web/models/worker_pool_properties.rb'
    autoload :VirtualIPMapping,                                   'azure_mgmt_web/models/virtual_ipmapping.rb'
    autoload :StampCapacity,                                      'azure_mgmt_web/models/stamp_capacity.rb'
    autoload :NetworkAccessControlEntry,                          'azure_mgmt_web/models/network_access_control_entry.rb'
    autoload :ManagedHostingEnvironmentCollection,                'azure_mgmt_web/models/managed_hosting_environment_collection.rb'
    autoload :ManagedHostingEnvironmentProperties,                'azure_mgmt_web/models/managed_hosting_environment_properties.rb'
    autoload :ResourceNameAvailabilityRequest,                    'azure_mgmt_web/models/resource_name_availability_request.rb'
    autoload :ResourceNameAvailability,                           'azure_mgmt_web/models/resource_name_availability.rb'
    autoload :DomainControlCenterSsoRequest,                      'azure_mgmt_web/models/domain_control_center_sso_request.rb'
    autoload :DomainRegistrationInputProperties,                  'azure_mgmt_web/models/domain_registration_input_properties.rb'
    autoload :NameIdentifier,                                     'azure_mgmt_web/models/name_identifier.rb'
    autoload :DomainAvailablilityCheckResult,                     'azure_mgmt_web/models/domain_availablility_check_result.rb'
    autoload :DomainRecommendationSearchParameters,               'azure_mgmt_web/models/domain_recommendation_search_parameters.rb'
    autoload :NameIdentifierCollection,                           'azure_mgmt_web/models/name_identifier_collection.rb'
    autoload :CsmMoveResourceEnvelope,                            'azure_mgmt_web/models/csm_move_resource_envelope.rb'
    autoload :HostingEnvironmentDiagnostics,                      'azure_mgmt_web/models/hosting_environment_diagnostics.rb'
    autoload :StampCapacityCollection,                            'azure_mgmt_web/models/stamp_capacity_collection.rb'
    autoload :AddressResponse,                                    'azure_mgmt_web/models/address_response.rb'
    autoload :ResourceMetricCollection,                           'azure_mgmt_web/models/resource_metric_collection.rb'
    autoload :ResourceMetric,                                     'azure_mgmt_web/models/resource_metric.rb'
    autoload :ResourceMetricName,                                 'azure_mgmt_web/models/resource_metric_name.rb'
    autoload :ResourceMetricValue,                                'azure_mgmt_web/models/resource_metric_value.rb'
    autoload :KeyValuePairStringString,                           'azure_mgmt_web/models/key_value_pair_string_string.rb'
    autoload :MetricDefinitionProperties,                         'azure_mgmt_web/models/metric_definition_properties.rb'
    autoload :MetricAvailabilily,                                 'azure_mgmt_web/models/metric_availabilily.rb'
    autoload :CsmUsageQuotaCollection,                            'azure_mgmt_web/models/csm_usage_quota_collection.rb'
    autoload :CsmUsageQuota,                                      'azure_mgmt_web/models/csm_usage_quota.rb'
    autoload :LocalizableString,                                  'azure_mgmt_web/models/localizable_string.rb'
    autoload :MetricDefinitionCollection,                         'azure_mgmt_web/models/metric_definition_collection.rb'
    autoload :UsageCollection,                                    'azure_mgmt_web/models/usage_collection.rb'
    autoload :UsageProperties,                                    'azure_mgmt_web/models/usage_properties.rb'
    autoload :WorkerPoolCollection,                               'azure_mgmt_web/models/worker_pool_collection.rb'
    autoload :SkuInfoCollection,                                  'azure_mgmt_web/models/sku_info_collection.rb'
    autoload :SkuInfo,                                            'azure_mgmt_web/models/sku_info.rb'
    autoload :SkuCapacity,                                        'azure_mgmt_web/models/sku_capacity.rb'
    autoload :SourceControlCollection,                            'azure_mgmt_web/models/source_control_collection.rb'
    autoload :SourceControlProperties,                            'azure_mgmt_web/models/source_control_properties.rb'
    autoload :Recommendation,                                     'azure_mgmt_web/models/recommendation.rb'
    autoload :RecommendationRule,                                 'azure_mgmt_web/models/recommendation_rule.rb'
    autoload :VnetInfoProperties,                                 'azure_mgmt_web/models/vnet_info_properties.rb'
    autoload :VnetRouteProperties,                                'azure_mgmt_web/models/vnet_route_properties.rb'
    autoload :VnetGatewayProperties,                              'azure_mgmt_web/models/vnet_gateway_properties.rb'
    autoload :NetworkFeaturesProperties,                          'azure_mgmt_web/models/network_features_properties.rb'
    autoload :RelayServiceConnectionEntityProperties,             'azure_mgmt_web/models/relay_service_connection_entity_properties.rb'
    autoload :CsmSlotEntity,                                      'azure_mgmt_web/models/csm_slot_entity.rb'
    autoload :SlotDifferenceCollection,                           'azure_mgmt_web/models/slot_difference_collection.rb'
    autoload :SlotDifferenceProperties,                           'azure_mgmt_web/models/slot_difference_properties.rb'
    autoload :SlotConfigNamesResourceProperties,                  'azure_mgmt_web/models/slot_config_names_resource_properties.rb'
    autoload :SlotConfigNames,                                    'azure_mgmt_web/models/slot_config_names.rb'
    autoload :SiteCloneability,                                   'azure_mgmt_web/models/site_cloneability.rb'
    autoload :SiteCloneabilityCriterion,                          'azure_mgmt_web/models/site_cloneability_criterion.rb'
    autoload :CsmSiteRecoveryEntity,                              'azure_mgmt_web/models/csm_site_recovery_entity.rb'
    autoload :DeletedSiteCollection,                              'azure_mgmt_web/models/deleted_site_collection.rb'
    autoload :DeletedSiteProperties,                              'azure_mgmt_web/models/deleted_site_properties.rb'
    autoload :DeploymentCollection,                               'azure_mgmt_web/models/deployment_collection.rb'
    autoload :DeploymentProperties,                               'azure_mgmt_web/models/deployment_properties.rb'
    autoload :SiteInstanceCollection,                             'azure_mgmt_web/models/site_instance_collection.rb'
    autoload :SiteInstanceProperties,                             'azure_mgmt_web/models/site_instance_properties.rb'
    autoload :HostNameBindingCollection,                          'azure_mgmt_web/models/host_name_binding_collection.rb'
    autoload :HostNameBindingProperties,                          'azure_mgmt_web/models/host_name_binding_properties.rb'
    autoload :SiteSourceControlProperties,                        'azure_mgmt_web/models/site_source_control_properties.rb'
    autoload :ConnStringValueTypePair,                            'azure_mgmt_web/models/conn_string_value_type_pair.rb'
    autoload :SiteLogsConfigProperties,                           'azure_mgmt_web/models/site_logs_config_properties.rb'
    autoload :ApplicationLogsConfig,                              'azure_mgmt_web/models/application_logs_config.rb'
    autoload :FileSystemApplicationLogsConfig,                    'azure_mgmt_web/models/file_system_application_logs_config.rb'
    autoload :AzureTableStorageApplicationLogsConfig,             'azure_mgmt_web/models/azure_table_storage_application_logs_config.rb'
    autoload :AzureBlobStorageApplicationLogsConfig,              'azure_mgmt_web/models/azure_blob_storage_application_logs_config.rb'
    autoload :HttpLogsConfig,                                     'azure_mgmt_web/models/http_logs_config.rb'
    autoload :FileSystemHttpLogsConfig,                           'azure_mgmt_web/models/file_system_http_logs_config.rb'
    autoload :AzureBlobStorageHttpLogsConfig,                     'azure_mgmt_web/models/azure_blob_storage_http_logs_config.rb'
    autoload :EnabledConfig,                                      'azure_mgmt_web/models/enabled_config.rb'
    autoload :PremierAddOnRequest,                                'azure_mgmt_web/models/premier_add_on_request.rb'
    autoload :BackupRequestProperties,                            'azure_mgmt_web/models/backup_request_properties.rb'
    autoload :BackupSchedule,                                     'azure_mgmt_web/models/backup_schedule.rb'
    autoload :DatabaseBackupSetting,                              'azure_mgmt_web/models/database_backup_setting.rb'
    autoload :BackupItemProperties,                               'azure_mgmt_web/models/backup_item_properties.rb'
    autoload :RestoreRequestProperties,                           'azure_mgmt_web/models/restore_request_properties.rb'
    autoload :BackupItemCollection,                               'azure_mgmt_web/models/backup_item_collection.rb'
    autoload :RestoreResponseProperties,                          'azure_mgmt_web/models/restore_response_properties.rb'
    autoload :CsmPublishingProfileOptions,                        'azure_mgmt_web/models/csm_publishing_profile_options.rb'
    autoload :TopLevelDomainCollection,                           'azure_mgmt_web/models/top_level_domain_collection.rb'
    autoload :TopLevelDomainProperties,                           'azure_mgmt_web/models/top_level_domain_properties.rb'
    autoload :TopLevelDomainAgreementOption,                      'azure_mgmt_web/models/top_level_domain_agreement_option.rb'
    autoload :TldLegalAgreementCollection,                        'azure_mgmt_web/models/tld_legal_agreement_collection.rb'
    autoload :TldLegalAgreement,                                  'azure_mgmt_web/models/tld_legal_agreement.rb'
    autoload :CertificateOrderCertificate,                        'azure_mgmt_web/models/certificate_order_certificate.rb'
    autoload :CertificateOrder,                                   'azure_mgmt_web/models/certificate_order.rb'
    autoload :CertificateDetails,                                 'azure_mgmt_web/models/certificate_details.rb'
    autoload :ReissueCertificateOrderRequest,                     'azure_mgmt_web/models/reissue_certificate_order_request.rb'
    autoload :RenewCertificateOrderRequest,                       'azure_mgmt_web/models/renew_certificate_order_request.rb'
    autoload :CertificateOrderAction,                             'azure_mgmt_web/models/certificate_order_action.rb'
    autoload :CertificateEmail,                                   'azure_mgmt_web/models/certificate_email.rb'
    autoload :Certificate,                                        'azure_mgmt_web/models/certificate.rb'
    autoload :Csr,                                                'azure_mgmt_web/models/csr.rb'
    autoload :ClassicMobileService,                               'azure_mgmt_web/models/classic_mobile_service.rb'
    autoload :Domain,                                             'azure_mgmt_web/models/domain.rb'
    autoload :User,                                               'azure_mgmt_web/models/user.rb'
    autoload :GeoRegion,                                          'azure_mgmt_web/models/geo_region.rb'
    autoload :ServerFarmWithRichSku,                              'azure_mgmt_web/models/server_farm_with_rich_sku.rb'
    autoload :Site,                                               'azure_mgmt_web/models/site.rb'
    autoload :SiteConfig,                                         'azure_mgmt_web/models/site_config.rb'
    autoload :HostingEnvironment,                                 'azure_mgmt_web/models/hosting_environment.rb'
    autoload :WorkerPool,                                         'azure_mgmt_web/models/worker_pool.rb'
    autoload :ManagedHostingEnvironment,                          'azure_mgmt_web/models/managed_hosting_environment.rb'
    autoload :DomainRegistrationInput,                            'azure_mgmt_web/models/domain_registration_input.rb'
    autoload :MetricDefinition,                                   'azure_mgmt_web/models/metric_definition.rb'
    autoload :Usage,                                              'azure_mgmt_web/models/usage.rb'
    autoload :SourceControl,                                      'azure_mgmt_web/models/source_control.rb'
    autoload :VnetInfo,                                           'azure_mgmt_web/models/vnet_info.rb'
    autoload :VnetRoute,                                          'azure_mgmt_web/models/vnet_route.rb'
    autoload :VnetGateway,                                        'azure_mgmt_web/models/vnet_gateway.rb'
    autoload :NetworkFeatures,                                    'azure_mgmt_web/models/network_features.rb'
    autoload :RelayServiceConnectionEntity,                       'azure_mgmt_web/models/relay_service_connection_entity.rb'
    autoload :SlotDifference,                                     'azure_mgmt_web/models/slot_difference.rb'
    autoload :SlotConfigNamesResource,                            'azure_mgmt_web/models/slot_config_names_resource.rb'
    autoload :DeletedSite,                                        'azure_mgmt_web/models/deleted_site.rb'
    autoload :Deployment,                                         'azure_mgmt_web/models/deployment.rb'
    autoload :SiteInstance,                                       'azure_mgmt_web/models/site_instance.rb'
    autoload :HostNameBinding,                                    'azure_mgmt_web/models/host_name_binding.rb'
    autoload :SiteSourceControl,                                  'azure_mgmt_web/models/site_source_control.rb'
    autoload :StringDictionary,                                   'azure_mgmt_web/models/string_dictionary.rb'
    autoload :ConnectionStringDictionary,                         'azure_mgmt_web/models/connection_string_dictionary.rb'
    autoload :SiteLogsConfig,                                     'azure_mgmt_web/models/site_logs_config.rb'
    autoload :BackupRequest,                                      'azure_mgmt_web/models/backup_request.rb'
    autoload :BackupItem,                                         'azure_mgmt_web/models/backup_item.rb'
    autoload :RestoreRequest,                                     'azure_mgmt_web/models/restore_request.rb'
    autoload :RestoreResponse,                                    'azure_mgmt_web/models/restore_response.rb'
    autoload :TopLevelDomain,                                     'azure_mgmt_web/models/top_level_domain.rb'
    autoload :KeyVaultSecretStatus,                               'azure_mgmt_web/models/key_vault_secret_status.rb'
    autoload :CertificateProductType,                             'azure_mgmt_web/models/certificate_product_type.rb'
    autoload :ProvisioningState,                                  'azure_mgmt_web/models/provisioning_state.rb'
    autoload :CertificateOrderStatus,                             'azure_mgmt_web/models/certificate_order_status.rb'
    autoload :CertificateOrderActionType,                         'azure_mgmt_web/models/certificate_order_action_type.rb'
    autoload :DomainStatus,                                       'azure_mgmt_web/models/domain_status.rb'
    autoload :AzureResourceType,                                  'azure_mgmt_web/models/azure_resource_type.rb'
    autoload :CustomHostNameDnsRecordType,                        'azure_mgmt_web/models/custom_host_name_dns_record_type.rb'
    autoload :HostNameType,                                       'azure_mgmt_web/models/host_name_type.rb'
    autoload :StatusOptions,                                      'azure_mgmt_web/models/status_options.rb'
    autoload :UsageState,                                         'azure_mgmt_web/models/usage_state.rb'
    autoload :SiteAvailabilityState,                              'azure_mgmt_web/models/site_availability_state.rb'
    autoload :SslState,                                           'azure_mgmt_web/models/ssl_state.rb'
    autoload :DatabaseServerType,                                 'azure_mgmt_web/models/database_server_type.rb'
    autoload :ManagedPipelineMode,                                'azure_mgmt_web/models/managed_pipeline_mode.rb'
    autoload :SiteLoadBalancing,                                  'azure_mgmt_web/models/site_load_balancing.rb'
    autoload :AutoHealActionType,                                 'azure_mgmt_web/models/auto_heal_action_type.rb'
    autoload :UnauthenticatedClientAction,                        'azure_mgmt_web/models/unauthenticated_client_action.rb'
    autoload :BuiltInAuthenticationProvider,                      'azure_mgmt_web/models/built_in_authentication_provider.rb'
    autoload :HostingEnvironmentStatus,                           'azure_mgmt_web/models/hosting_environment_status.rb'
    autoload :InternalLoadBalancingMode,                          'azure_mgmt_web/models/internal_load_balancing_mode.rb'
    autoload :ComputeModeOptions,                                 'azure_mgmt_web/models/compute_mode_options.rb'
    autoload :WorkerSizeOptions,                                  'azure_mgmt_web/models/worker_size_options.rb'
    autoload :AccessControlEntryAction,                           'azure_mgmt_web/models/access_control_entry_action.rb'
    autoload :ManagedHostingEnvironmentStatus,                    'azure_mgmt_web/models/managed_hosting_environment_status.rb'
    autoload :DomainType,                                         'azure_mgmt_web/models/domain_type.rb'
    autoload :NotificationLevel,                                  'azure_mgmt_web/models/notification_level.rb'
    autoload :Channels,                                           'azure_mgmt_web/models/channels.rb'
    autoload :CloneAbilityResult,                                 'azure_mgmt_web/models/clone_ability_result.rb'
    autoload :LogLevel,                                           'azure_mgmt_web/models/log_level.rb'
    autoload :FrequencyUnit,                                      'azure_mgmt_web/models/frequency_unit.rb'
    autoload :BackupRestoreOperationType,                         'azure_mgmt_web/models/backup_restore_operation_type.rb'
    autoload :BackupItemStatus,                                   'azure_mgmt_web/models/backup_item_status.rb'
  end
end
