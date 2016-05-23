# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::CDN
  module Models
    #
    # CDN REST API operation
    #
    class Operation

      include MsRestAzure

      # @return [String] Operation name: {provider}/{resource}/{operation}
      attr_accessor :name

      # @return [OperationDisplay]
      attr_accessor :display

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @display.validate unless @display.nil?
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

        serialized_property = object.display
        unless serialized_property.nil?
          serialized_property = OperationDisplay.serialize_object(serialized_property)
        end
        output_object['display'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [Operation] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = Operation.new

        deserialized_property = object['name']
        output_object.name = deserialized_property

        deserialized_property = object['display']
        unless deserialized_property.nil?
          deserialized_property = OperationDisplay.deserialize_object(deserialized_property)
        end
        output_object.display = deserialized_property

        output_object
      end
    end
  end
end
