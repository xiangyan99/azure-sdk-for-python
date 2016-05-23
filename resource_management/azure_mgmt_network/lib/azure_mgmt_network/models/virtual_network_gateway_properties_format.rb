# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # VirtualNeworkGateay properties
    #
    class VirtualNetworkGatewayPropertiesFormat

      include MsRestAzure

      # @return [Array<VirtualNetworkGatewayIPConfiguration>] IpConfigurations
      # for Virtual network gateway.
      attr_accessor :ip_configurations

      # @return [VirtualNetworkGatewayType] The type of this virtual network
      # gateway. Possible values include: 'Vpn', 'ExpressRoute'
      attr_accessor :gateway_type

      # @return [VpnType] The type of this virtual network gateway. Possible
      # values include: 'PolicyBased', 'RouteBased'
      attr_accessor :vpn_type

      # @return [Boolean] EnableBgp Flag
      attr_accessor :enable_bgp

      # @return [SubResource] Gets or sets the reference of the
      # LocalNetworkGateway resource which represents Local network site
      # having default routes. Assign Null value in case of removing existing
      # default site setting.
      attr_accessor :gateway_default_site

      # @return [VirtualNetworkGatewaySku] Gets or sets the reference of the
      # VirtualNetworkGatewaySku resource which represents the sku selected
      # for Virtual network gateway.
      attr_accessor :sku

      # @return [VpnClientConfiguration] Gets or sets the reference of the
      # VpnClientConfiguration resource which represents the P2S VpnClient
      # configurations.
      attr_accessor :vpn_client_configuration

      # @return [BgpSettings] Virtual network gateway's BGP speaker settings
      attr_accessor :bgp_settings

      # @return [String] Gets or sets resource guid property of the
      # VirtualNetworkGateway resource
      attr_accessor :resource_guid

      # @return [String] Gets or sets Provisioning state of the
      # VirtualNetworkGateway resource Updating/Deleting/Failed
      attr_accessor :provisioning_state

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @ip_configurations.each{ |e| e.validate if e.respond_to?(:validate) } unless @ip_configurations.nil?
        @gateway_default_site.validate unless @gateway_default_site.nil?
        @sku.validate unless @sku.nil?
        @vpn_client_configuration.validate unless @vpn_client_configuration.nil?
        @bgp_settings.validate unless @bgp_settings.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.ip_configurations
        unless serialized_property.nil?
          serializedArray = []
          serialized_property.each do |element|
            unless element.nil?
              element = VirtualNetworkGatewayIPConfiguration.serialize_object(element)
            end
            serializedArray.push(element)
          end
          serialized_property = serializedArray
        end
        output_object['ipConfigurations'] = serialized_property unless serialized_property.nil?

        serialized_property = object.gateway_type
        output_object['gatewayType'] = serialized_property unless serialized_property.nil?

        serialized_property = object.vpn_type
        output_object['vpnType'] = serialized_property unless serialized_property.nil?

        serialized_property = object.enable_bgp
        output_object['enableBgp'] = serialized_property unless serialized_property.nil?

        serialized_property = object.gateway_default_site
        unless serialized_property.nil?
          serialized_property = MsRestAzure::SubResource.serialize_object(serialized_property)
        end
        output_object['gatewayDefaultSite'] = serialized_property unless serialized_property.nil?

        serialized_property = object.sku
        unless serialized_property.nil?
          serialized_property = VirtualNetworkGatewaySku.serialize_object(serialized_property)
        end
        output_object['sku'] = serialized_property unless serialized_property.nil?

        serialized_property = object.vpn_client_configuration
        unless serialized_property.nil?
          serialized_property = VpnClientConfiguration.serialize_object(serialized_property)
        end
        output_object['vpnClientConfiguration'] = serialized_property unless serialized_property.nil?

        serialized_property = object.bgp_settings
        unless serialized_property.nil?
          serialized_property = BgpSettings.serialize_object(serialized_property)
        end
        output_object['bgpSettings'] = serialized_property unless serialized_property.nil?

        serialized_property = object.resource_guid
        output_object['resourceGuid'] = serialized_property unless serialized_property.nil?

        serialized_property = object.provisioning_state
        output_object['provisioningState'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualNetworkGatewayPropertiesFormat] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualNetworkGatewayPropertiesFormat.new

        deserialized_property = object['ipConfigurations']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element1|
            unless element1.nil?
              element1 = VirtualNetworkGatewayIPConfiguration.deserialize_object(element1)
            end
            deserialized_array.push(element1)
          end
          deserialized_property = deserialized_array
        end
        output_object.ip_configurations = deserialized_property

        deserialized_property = object['gatewayType']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = VirtualNetworkGatewayType.constants.any? { |e| VirtualNetworkGatewayType.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum VirtualNetworkGatewayType does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.gateway_type = deserialized_property

        deserialized_property = object['vpnType']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = VpnType.constants.any? { |e| VpnType.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum VpnType does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.vpn_type = deserialized_property

        deserialized_property = object['enableBgp']
        output_object.enable_bgp = deserialized_property

        deserialized_property = object['gatewayDefaultSite']
        unless deserialized_property.nil?
          deserialized_property = MsRestAzure::SubResource.deserialize_object(deserialized_property)
        end
        output_object.gateway_default_site = deserialized_property

        deserialized_property = object['sku']
        unless deserialized_property.nil?
          deserialized_property = VirtualNetworkGatewaySku.deserialize_object(deserialized_property)
        end
        output_object.sku = deserialized_property

        deserialized_property = object['vpnClientConfiguration']
        unless deserialized_property.nil?
          deserialized_property = VpnClientConfiguration.deserialize_object(deserialized_property)
        end
        output_object.vpn_client_configuration = deserialized_property

        deserialized_property = object['bgpSettings']
        unless deserialized_property.nil?
          deserialized_property = BgpSettings.deserialize_object(deserialized_property)
        end
        output_object.bgp_settings = deserialized_property

        deserialized_property = object['resourceGuid']
        output_object.resource_guid = deserialized_property

        deserialized_property = object['provisioningState']
        output_object.provisioning_state = deserialized_property

        output_object
      end
    end
  end
end
