# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Dns Settings of a network interface
    #
    class NetworkInterfaceDnsSettings

      include MsRestAzure

      # @return [Array<String>] Gets or sets list of DNS servers IP addresses
      attr_accessor :dns_servers

      # @return [Array<String>] Gets or sets list of Applied DNS servers IP
      # addresses
      attr_accessor :applied_dns_servers

      # @return [String] Gets or sets the Internal DNS name
      attr_accessor :internal_dns_name_label

      # @return [String] Gets or sets the internal fqdn.
      attr_accessor :internal_fqdn

      # @return [String] Gets or sets internal domain name suffix of the NIC.
      attr_accessor :internal_domain_name_suffix

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @dns_servers.each{ |e| e.validate if e.respond_to?(:validate) } unless @dns_servers.nil?
        @applied_dns_servers.each{ |e| e.validate if e.respond_to?(:validate) } unless @applied_dns_servers.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.dns_servers
        output_object['dnsServers'] = serialized_property unless serialized_property.nil?

        serialized_property = object.applied_dns_servers
        output_object['appliedDnsServers'] = serialized_property unless serialized_property.nil?

        serialized_property = object.internal_dns_name_label
        output_object['internalDnsNameLabel'] = serialized_property unless serialized_property.nil?

        serialized_property = object.internal_fqdn
        output_object['internalFqdn'] = serialized_property unless serialized_property.nil?

        serialized_property = object.internal_domain_name_suffix
        output_object['internalDomainNameSuffix'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [NetworkInterfaceDnsSettings] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = NetworkInterfaceDnsSettings.new

        deserialized_property = object['dnsServers']
        output_object.dns_servers = deserialized_property

        deserialized_property = object['appliedDnsServers']
        output_object.applied_dns_servers = deserialized_property

        deserialized_property = object['internalDnsNameLabel']
        output_object.internal_dns_name_label = deserialized_property

        deserialized_property = object['internalFqdn']
        output_object.internal_fqdn = deserialized_property

        deserialized_property = object['internalDomainNameSuffix']
        output_object.internal_domain_name_suffix = deserialized_property

        output_object
      end
    end
  end
end
