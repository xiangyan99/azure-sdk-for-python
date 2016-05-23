# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Compute-specific operation properties, including output
    #
    class VirtualMachineCaptureResultProperties

      include MsRestAzure

      # @return Operation output data (raw JSON)
      attr_accessor :output

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

        serialized_property = object.output
        output_object['output'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualMachineCaptureResultProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualMachineCaptureResultProperties.new

        deserialized_property = object['output']
        output_object.output = deserialized_property

        output_object
      end
    end
  end
end
