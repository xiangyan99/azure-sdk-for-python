# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Model object.
    #
    class SiteProperties

      include MsRestAzure

      # @return [String] Name of web app
      attr_accessor :name

      # @return [String] State of the web app
      attr_accessor :state

      # @return [Array<String>] Hostnames associated with web app
      attr_accessor :host_names

      # @return [String] Name of repository site
      attr_accessor :repository_site_name

      # @return [UsageState] State indicating whether web app has exceeded its
      # quota usage. Possible values include: 'Normal', 'Exceeded'
      attr_accessor :usage_state

      # @return [Boolean] True if the site is enabled; otherwise, false.
      # Setting this  value to false disables the site (takes the site off
      # line).
      attr_accessor :enabled

      # @return [Array<String>] Hostnames for the web app that are enabled.
      # Hostnames need to be assigned and enabled. If some hostnames are
      # assigned but not enabled
      # the app is not served on those hostnames
      attr_accessor :enabled_host_names

      # @return [SiteAvailabilityState] Management information availability
      # state for the web app. Possible values are Normal or Limited.
      # Normal means that the site is running correctly and that
      # management information for the site is available.
      # Limited means that only partial management information for
      # the site is available and that detailed site information is
      # unavailable. Possible values include: 'Normal', 'Limited',
      # 'DisasterRecoveryMode'
      attr_accessor :availability_state

      # @return [Array<HostNameSslState>] Hostname SSL states are  used to
      # manage the SSL bindings for site's hostnames.
      attr_accessor :host_name_ssl_states

      # @return [String]
      attr_accessor :server_farm_id

      # @return [DateTime] Last time web app was modified in UTC
      attr_accessor :last_modified_time_utc

      # @return [SiteConfig] Configuration of web app
      attr_accessor :site_config

      # @return [Array<String>] Read-only list of Azure Traffic manager
      # hostnames associated with web app
      attr_accessor :traffic_manager_host_names

      # @return [Boolean] If set indicates whether web app is deployed as a
      # premium app
      attr_accessor :premium_app_deployed

      # @return [Boolean] If set indicates whether to stop SCM (KUDU) site
      # when the web app is stopped. Default is false.
      attr_accessor :scm_site_also_stopped

      # @return [String] Read-only property that specifies which slot this app
      # will swap into
      attr_accessor :target_swap_slot

      # @return [HostingEnvironmentProfile] Specification for the hosting
      # environment (App Service Environment) to use for the web app
      attr_accessor :hosting_environment_profile

      # @return [String]
      attr_accessor :micro_service

      # @return [String] Name of gateway app associated with web app
      attr_accessor :gateway_site_name

      # @return [Boolean] Specifies if the client affinity is enabled when
      # load balancing http request for multiple instances of the web app
      attr_accessor :client_affinity_enabled

      # @return [Boolean] Specifies if the client certificate is enabled for
      # the web app
      attr_accessor :client_cert_enabled

      # @return [Boolean] Specifies if the public hostnames are disabled the
      # web app.
      # If set to true the app is only accessible via API
      # Management process
      attr_accessor :host_names_disabled

      # @return [String] List of comma separated IP addresses that this web
      # app uses for outbound connections. Those can be used when configuring
      # firewall rules for databases accessed by this web app.
      attr_accessor :outbound_ip_addresses

      # @return [Integer] Size of a function container
      attr_accessor :container_size

      # @return [Integer] Maximum number of workers
      # This only applies to function container
      attr_accessor :max_number_of_workers

      # @return [CloningInfo] This is only valid for web app creation. If
      # specified, web app is cloned from
      # a source web app
      attr_accessor :cloning_info

      # @return [String] Resource group web app belongs to
      attr_accessor :resource_group

      # @return [Boolean] Site is a default container
      attr_accessor :is_default_container

      # @return [String] Default hostname of the web app
      attr_accessor :default_host_name

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @host_names.each{ |e| e.validate if e.respond_to?(:validate) } unless @host_names.nil?
        @enabled_host_names.each{ |e| e.validate if e.respond_to?(:validate) } unless @enabled_host_names.nil?
        @host_name_ssl_states.each{ |e| e.validate if e.respond_to?(:validate) } unless @host_name_ssl_states.nil?
        @site_config.validate unless @site_config.nil?
        @traffic_manager_host_names.each{ |e| e.validate if e.respond_to?(:validate) } unless @traffic_manager_host_names.nil?
        @hosting_environment_profile.validate unless @hosting_environment_profile.nil?
        @cloning_info.validate unless @cloning_info.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.name
        output_object['name'] = serialized_property unless serialized_property.nil?

        serialized_property = object.state
        output_object['state'] = serialized_property unless serialized_property.nil?

        serialized_property = object.host_names
        output_object['hostNames'] = serialized_property unless serialized_property.nil?

        serialized_property = object.repository_site_name
        output_object['repositorySiteName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.usage_state
        output_object['usageState'] = serialized_property unless serialized_property.nil?

        serialized_property = object.enabled
        output_object['enabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.enabled_host_names
        output_object['enabledHostNames'] = serialized_property unless serialized_property.nil?

        serialized_property = object.availability_state
        output_object['availabilityState'] = serialized_property unless serialized_property.nil?

        serialized_property = object.host_name_ssl_states
        unless serialized_property.nil?
          serializedArray = []
          serialized_property.each do |element2|
            unless element2.nil?
              element2 = HostNameSslState.serialize_object(element2)
            end
            serializedArray.push(element2)
          end
          serialized_property = serializedArray
        end
        output_object['hostNameSslStates'] = serialized_property unless serialized_property.nil?

        serialized_property = object.server_farm_id
        output_object['serverFarmId'] = serialized_property unless serialized_property.nil?

        serialized_property = object.last_modified_time_utc
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['lastModifiedTimeUtc'] = serialized_property unless serialized_property.nil?

        serialized_property = object.site_config
        unless serialized_property.nil?
          serialized_property = SiteConfig.serialize_object(serialized_property)
        end
        output_object['siteConfig'] = serialized_property unless serialized_property.nil?

        serialized_property = object.traffic_manager_host_names
        output_object['trafficManagerHostNames'] = serialized_property unless serialized_property.nil?

        serialized_property = object.premium_app_deployed
        output_object['premiumAppDeployed'] = serialized_property unless serialized_property.nil?

        serialized_property = object.scm_site_also_stopped
        output_object['scmSiteAlsoStopped'] = serialized_property unless serialized_property.nil?

        serialized_property = object.target_swap_slot
        output_object['targetSwapSlot'] = serialized_property unless serialized_property.nil?

        serialized_property = object.hosting_environment_profile
        unless serialized_property.nil?
          serialized_property = HostingEnvironmentProfile.serialize_object(serialized_property)
        end
        output_object['hostingEnvironmentProfile'] = serialized_property unless serialized_property.nil?

        serialized_property = object.micro_service
        output_object['microService'] = serialized_property unless serialized_property.nil?

        serialized_property = object.gateway_site_name
        output_object['gatewaySiteName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.client_affinity_enabled
        output_object['clientAffinityEnabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.client_cert_enabled
        output_object['clientCertEnabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.host_names_disabled
        output_object['hostNamesDisabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.outbound_ip_addresses
        output_object['outboundIpAddresses'] = serialized_property unless serialized_property.nil?

        serialized_property = object.container_size
        output_object['containerSize'] = serialized_property unless serialized_property.nil?

        serialized_property = object.max_number_of_workers
        output_object['maxNumberOfWorkers'] = serialized_property unless serialized_property.nil?

        serialized_property = object.cloning_info
        unless serialized_property.nil?
          serialized_property = CloningInfo.serialize_object(serialized_property)
        end
        output_object['cloningInfo'] = serialized_property unless serialized_property.nil?

        serialized_property = object.resource_group
        output_object['resourceGroup'] = serialized_property unless serialized_property.nil?

        serialized_property = object.is_default_container
        output_object['isDefaultContainer'] = serialized_property unless serialized_property.nil?

        serialized_property = object.default_host_name
        output_object['defaultHostName'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [SiteProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = SiteProperties.new

        deserialized_property = object['name']
        output_object.name = deserialized_property

        deserialized_property = object['state']
        output_object.state = deserialized_property

        deserialized_property = object['hostNames']
        output_object.host_names = deserialized_property

        deserialized_property = object['repositorySiteName']
        output_object.repository_site_name = deserialized_property

        deserialized_property = object['usageState']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = UsageState.constants.any? { |e| UsageState.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum UsageState does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.usage_state = deserialized_property

        deserialized_property = object['enabled']
        output_object.enabled = deserialized_property

        deserialized_property = object['enabledHostNames']
        output_object.enabled_host_names = deserialized_property

        deserialized_property = object['availabilityState']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = SiteAvailabilityState.constants.any? { |e| SiteAvailabilityState.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum SiteAvailabilityState does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.availability_state = deserialized_property

        deserialized_property = object['hostNameSslStates']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element6|
            unless element6.nil?
              element6 = HostNameSslState.deserialize_object(element6)
            end
            deserialized_array.push(element6)
          end
          deserialized_property = deserialized_array
        end
        output_object.host_name_ssl_states = deserialized_property

        deserialized_property = object['serverFarmId']
        output_object.server_farm_id = deserialized_property

        deserialized_property = object['lastModifiedTimeUtc']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.last_modified_time_utc = deserialized_property

        deserialized_property = object['siteConfig']
        unless deserialized_property.nil?
          deserialized_property = SiteConfig.deserialize_object(deserialized_property)
        end
        output_object.site_config = deserialized_property

        deserialized_property = object['trafficManagerHostNames']
        output_object.traffic_manager_host_names = deserialized_property

        deserialized_property = object['premiumAppDeployed']
        output_object.premium_app_deployed = deserialized_property

        deserialized_property = object['scmSiteAlsoStopped']
        output_object.scm_site_also_stopped = deserialized_property

        deserialized_property = object['targetSwapSlot']
        output_object.target_swap_slot = deserialized_property

        deserialized_property = object['hostingEnvironmentProfile']
        unless deserialized_property.nil?
          deserialized_property = HostingEnvironmentProfile.deserialize_object(deserialized_property)
        end
        output_object.hosting_environment_profile = deserialized_property

        deserialized_property = object['microService']
        output_object.micro_service = deserialized_property

        deserialized_property = object['gatewaySiteName']
        output_object.gateway_site_name = deserialized_property

        deserialized_property = object['clientAffinityEnabled']
        output_object.client_affinity_enabled = deserialized_property

        deserialized_property = object['clientCertEnabled']
        output_object.client_cert_enabled = deserialized_property

        deserialized_property = object['hostNamesDisabled']
        output_object.host_names_disabled = deserialized_property

        deserialized_property = object['outboundIpAddresses']
        output_object.outbound_ip_addresses = deserialized_property

        deserialized_property = object['containerSize']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.container_size = deserialized_property

        deserialized_property = object['maxNumberOfWorkers']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.max_number_of_workers = deserialized_property

        deserialized_property = object['cloningInfo']
        unless deserialized_property.nil?
          deserialized_property = CloningInfo.deserialize_object(deserialized_property)
        end
        output_object.cloning_info = deserialized_property

        deserialized_property = object['resourceGroup']
        output_object.resource_group = deserialized_property

        deserialized_property = object['isDefaultContainer']
        output_object.is_default_container = deserialized_property

        deserialized_property = object['defaultHostName']
        output_object.default_host_name = deserialized_property

        output_object
      end
    end
  end
end
