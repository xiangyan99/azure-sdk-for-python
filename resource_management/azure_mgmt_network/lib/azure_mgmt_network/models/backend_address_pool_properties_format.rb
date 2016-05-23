# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Properties of BackendAddressPool
    #
    class BackendAddressPoolPropertiesFormat

      include MsRestAzure

      # @return [Array<NetworkInterfaceIPConfiguration>] Gets collection of
      # references to IPs defined in NICs
      attr_accessor :backend_ipconfigurations

      # @return [Array<SubResource>] Gets Load Balancing rules that use this
      # Backend Address Pool
      attr_accessor :load_balancing_rules

      # @return [SubResource] Gets outbound rules that use this Backend
      # Address Pool
      attr_accessor :outbound_nat_rule

      # @return [String] Provisioning state of the PublicIP resource
      # Updating/Deleting/Failed
      attr_accessor :provisioning_state

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @backend_ipconfigurations.each{ |e| e.validate if e.respond_to?(:validate) } unless @backend_ipconfigurations.nil?
        @load_balancing_rules.each{ |e| e.validate if e.respond_to?(:validate) } unless @load_balancing_rules.nil?
        @outbound_nat_rule.validate unless @outbound_nat_rule.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.backend_ipconfigurations
        unless serialized_property.nil?
          serializedArray = []
          serialized_property.each do |element|
            unless element.nil?
              element = NetworkInterfaceIPConfiguration.serialize_object(element)
            end
            serializedArray.push(element)
          end
          serialized_property = serializedArray
        end
        output_object['backendIPConfigurations'] = serialized_property unless serialized_property.nil?

        serialized_property = object.load_balancing_rules
        unless serialized_property.nil?
          serializedArray = []
          serialized_property.each do |element1|
            unless element1.nil?
              element1 = MsRestAzure::SubResource.serialize_object(element1)
            end
            serializedArray.push(element1)
          end
          serialized_property = serializedArray
        end
        output_object['loadBalancingRules'] = serialized_property unless serialized_property.nil?

        serialized_property = object.outbound_nat_rule
        unless serialized_property.nil?
          serialized_property = MsRestAzure::SubResource.serialize_object(serialized_property)
        end
        output_object['outboundNatRule'] = serialized_property unless serialized_property.nil?

        serialized_property = object.provisioning_state
        output_object['provisioningState'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [BackendAddressPoolPropertiesFormat] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = BackendAddressPoolPropertiesFormat.new

        deserialized_property = object['backendIPConfigurations']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element2|
            unless element2.nil?
              element2 = NetworkInterfaceIPConfiguration.deserialize_object(element2)
            end
            deserialized_array.push(element2)
          end
          deserialized_property = deserialized_array
        end
        output_object.backend_ipconfigurations = deserialized_property

        deserialized_property = object['loadBalancingRules']
        unless deserialized_property.nil?
          deserialized_array = []
          deserialized_property.each do |element3|
            unless element3.nil?
              element3 = MsRestAzure::SubResource.deserialize_object(element3)
            end
            deserialized_array.push(element3)
          end
          deserialized_property = deserialized_array
        end
        output_object.load_balancing_rules = deserialized_property

        deserialized_property = object['outboundNatRule']
        unless deserialized_property.nil?
          deserialized_property = MsRestAzure::SubResource.deserialize_object(deserialized_property)
        end
        output_object.outbound_nat_rule = deserialized_property

        deserialized_property = object['provisioningState']
        output_object.provisioning_state = deserialized_property

        output_object
      end
    end
  end
end
