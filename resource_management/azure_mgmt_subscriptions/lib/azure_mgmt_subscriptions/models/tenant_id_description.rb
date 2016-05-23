# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Subscriptions
  module Models
    #
    # Tenant Id information
    #
    class TenantIdDescription

      include MsRestAzure

      # @return [String] Gets or sets Id
      attr_accessor :id

      # @return [String] Gets or sets tenantId
      attr_accessor :tenant_id

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        # Nothing to validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.id
        output_object['id'] = serialized_property unless serialized_property.nil?

        serialized_property = object.tenant_id
        output_object['tenantId'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [TenantIdDescription] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = TenantIdDescription.new

        deserialized_property = object['id']
        output_object.id = deserialized_property

        deserialized_property = object['tenantId']
        output_object.tenant_id = deserialized_property

        output_object
      end
    end
  end
end
