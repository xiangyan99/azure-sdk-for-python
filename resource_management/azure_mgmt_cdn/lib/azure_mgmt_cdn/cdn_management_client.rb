# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::CDN
  #
  # A service client - single point of access to the REST API.
  #
  class CdnManagementClient < MsRestAzure::AzureServiceClient
    include Azure::ARM::CDN::Models
    include MsRestAzure

    # @return [String] the base URI of the service.
    attr_accessor :base_url

    # @return Gets Azure subscription credentials.
    attr_reader :credentials

    # @return [String] Azure Subscription ID.
    attr_accessor :subscription_id

    # @return [String] Version of the API to be used with the client request.
    # Current version is 2016-04-02
    attr_reader :api_version

    # @return [String] Gets or sets the preferred language for the response.
    attr_accessor :accept_language

    # @return [Integer] Gets or sets the retry timeout in seconds for Long
    # Running Operations. Default value is 30.
    attr_accessor :long_running_operation_retry_timeout

    # @return [Boolean] When set to true a unique x-ms-client-request-id value
    # is generated and included in each request. Default is true.
    attr_accessor :generate_client_request_id

    # @return Subscription credentials which uniquely identify client
    # subscription.
    attr_accessor :credentials

    # @return profiles
    attr_reader :profiles

    # @return endpoints
    attr_reader :endpoints

    # @return origins
    attr_reader :origins

    # @return custom_domains
    attr_reader :custom_domains

    # @return name_availability
    attr_reader :name_availability

    # @return operations
    attr_reader :operations

    #
    # Creates initializes a new instance of the CdnManagementClient class.
    # @param credentials [MsRest::ServiceClientCredentials] credentials to authorize HTTP requests made by the service client.
    # @param base_url [String] the base URI of the service.
    # @param options [Array] filters to be applied to the HTTP requests.
    #
    def initialize(credentials, base_url = nil, options = nil)
      super(credentials, options)
      @base_url = base_url || 'https://management.azure.com'

      fail ArgumentError, 'credentials is nil' if credentials.nil?
      fail ArgumentError, 'invalid type of credentials input parameter' unless credentials.is_a?(MsRest::ServiceClientCredentials)
      @credentials = credentials

      @profiles = Profiles.new(self)
      @endpoints = Endpoints.new(self)
      @origins = Origins.new(self)
      @custom_domains = CustomDomains.new(self)
      @name_availability = NameAvailability.new(self)
      @operations = Operations.new(self)
      @api_version = '2016-04-02'
      @accept_language = 'en-US'
      @long_running_operation_retry_timeout = 30
      @generate_client_request_id = true
    end

  end
end
