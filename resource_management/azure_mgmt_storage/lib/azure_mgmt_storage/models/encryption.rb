# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Storage
  module Models
    #
    # The encryption settings on the account.
    #
    class Encryption

      include MsRestAzure

      # @return [EncryptionServices] Gets the services which are encrypted.
      attr_accessor :services

      # @return [String] Gets the encryption keySource(provider). Possible
      # values (case-insensitive):  Microsoft.Storage
      attr_accessor :key_source

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property key_source is nil' if @key_source.nil?
        @services.validate unless @services.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.key_source
        output_object['keySource'] = serialized_property unless serialized_property.nil?

        serialized_property = object.services
        unless serialized_property.nil?
          serialized_property = EncryptionServices.serialize_object(serialized_property)
        end
        output_object['services'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [Encryption] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = Encryption.new

        deserialized_property = object['keySource']
        output_object.key_source = deserialized_property

        deserialized_property = object['services']
        unless deserialized_property.nil?
          deserialized_property = EncryptionServices.deserialize_object(deserialized_property)
        end
        output_object.services = deserialized_property

        output_object
      end
    end
  end
end
