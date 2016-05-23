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
require 'azure_mgmt_scheduler/module_definition'
require 'ms_rest_azure'

module Azure::ARM::Scheduler
  autoload :JobCollections,                                     'azure_mgmt_scheduler/job_collections.rb'
  autoload :Jobs,                                               'azure_mgmt_scheduler/jobs.rb'
  autoload :SchedulerManagementClient,                          'azure_mgmt_scheduler/scheduler_management_client.rb'

  module Models
    autoload :JobCollectionListResult,                            'azure_mgmt_scheduler/models/job_collection_list_result.rb'
    autoload :JobCollectionDefinition,                            'azure_mgmt_scheduler/models/job_collection_definition.rb'
    autoload :JobCollectionProperties,                            'azure_mgmt_scheduler/models/job_collection_properties.rb'
    autoload :Sku,                                                'azure_mgmt_scheduler/models/sku.rb'
    autoload :JobCollectionQuota,                                 'azure_mgmt_scheduler/models/job_collection_quota.rb'
    autoload :JobMaxRecurrence,                                   'azure_mgmt_scheduler/models/job_max_recurrence.rb'
    autoload :JobListResult,                                      'azure_mgmt_scheduler/models/job_list_result.rb'
    autoload :JobDefinition,                                      'azure_mgmt_scheduler/models/job_definition.rb'
    autoload :JobProperties,                                      'azure_mgmt_scheduler/models/job_properties.rb'
    autoload :JobAction,                                          'azure_mgmt_scheduler/models/job_action.rb'
    autoload :HttpRequest,                                        'azure_mgmt_scheduler/models/http_request.rb'
    autoload :HttpAuthentication,                                 'azure_mgmt_scheduler/models/http_authentication.rb'
    autoload :StorageQueueMessage,                                'azure_mgmt_scheduler/models/storage_queue_message.rb'
    autoload :RetryPolicy,                                        'azure_mgmt_scheduler/models/retry_policy.rb'
    autoload :JobErrorAction,                                     'azure_mgmt_scheduler/models/job_error_action.rb'
    autoload :JobRecurrence,                                      'azure_mgmt_scheduler/models/job_recurrence.rb'
    autoload :JobRecurrenceSchedule,                              'azure_mgmt_scheduler/models/job_recurrence_schedule.rb'
    autoload :JobRecurrenceScheduleMonthlyOccurrence,             'azure_mgmt_scheduler/models/job_recurrence_schedule_monthly_occurrence.rb'
    autoload :JobStatus,                                          'azure_mgmt_scheduler/models/job_status.rb'
    autoload :JobHistoryListResult,                               'azure_mgmt_scheduler/models/job_history_list_result.rb'
    autoload :JobHistoryDefinition,                               'azure_mgmt_scheduler/models/job_history_definition.rb'
    autoload :JobHistoryDefinitionProperties,                     'azure_mgmt_scheduler/models/job_history_definition_properties.rb'
    autoload :ServiceBusMessage,                                  'azure_mgmt_scheduler/models/service_bus_message.rb'
    autoload :ServiceBusAuthentication,                           'azure_mgmt_scheduler/models/service_bus_authentication.rb'
    autoload :ServiceBusBrokeredMessageProperties,                'azure_mgmt_scheduler/models/service_bus_brokered_message_properties.rb'
    autoload :JobStateFilter,                                     'azure_mgmt_scheduler/models/job_state_filter.rb'
    autoload :JobHistoryFilter,                                   'azure_mgmt_scheduler/models/job_history_filter.rb'
    autoload :ServiceBusQueueMessage,                             'azure_mgmt_scheduler/models/service_bus_queue_message.rb'
    autoload :ServiceBusTopicMessage,                             'azure_mgmt_scheduler/models/service_bus_topic_message.rb'
    autoload :ClientCertAuthentication,                           'azure_mgmt_scheduler/models/client_cert_authentication.rb'
    autoload :BasicAuthentication,                                'azure_mgmt_scheduler/models/basic_authentication.rb'
    autoload :OAuthAuthentication,                                'azure_mgmt_scheduler/models/oauth_authentication.rb'
    autoload :SkuDefinition,                                      'azure_mgmt_scheduler/models/sku_definition.rb'
    autoload :JobCollectionState,                                 'azure_mgmt_scheduler/models/job_collection_state.rb'
    autoload :RecurrenceFrequency,                                'azure_mgmt_scheduler/models/recurrence_frequency.rb'
    autoload :JobActionType,                                      'azure_mgmt_scheduler/models/job_action_type.rb'
    autoload :HttpAuthenticationType,                             'azure_mgmt_scheduler/models/http_authentication_type.rb'
    autoload :RetryType,                                          'azure_mgmt_scheduler/models/retry_type.rb'
    autoload :DayOfWeek,                                          'azure_mgmt_scheduler/models/day_of_week.rb'
    autoload :JobScheduleDay,                                     'azure_mgmt_scheduler/models/job_schedule_day.rb'
    autoload :JobState,                                           'azure_mgmt_scheduler/models/job_state.rb'
    autoload :JobHistoryActionName,                               'azure_mgmt_scheduler/models/job_history_action_name.rb'
    autoload :JobExecutionStatus,                                 'azure_mgmt_scheduler/models/job_execution_status.rb'
    autoload :ServiceBusAuthenticationType,                       'azure_mgmt_scheduler/models/service_bus_authentication_type.rb'
    autoload :ServiceBusTransportType,                            'azure_mgmt_scheduler/models/service_bus_transport_type.rb'
  end
end
