# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # The instance view of a virtual machine extension handler.
    #
    class VirtualMachineExtensionHandlerInstanceView

      include MsRestAzure

      # @return [String] Gets or sets full type of the extension handler which
      # includes both publisher and type.
      attr_accessor :type

      # @return [String] Gets or sets the type version of the extension
      # handler.
      attr_accessor :type_handler_version

      # @return [InstanceViewStatus] Gets or sets the extension handler status.
      attr_accessor :status

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @status.validate unless @status.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.type
        output_object['type'] = serialized_property unless serialized_property.nil?

        serialized_property = object.type_handler_version
        output_object['typeHandlerVersion'] = serialized_property unless serialized_property.nil?

        serialized_property = object.status
        unless serialized_property.nil?
          serialized_property = InstanceViewStatus.serialize_object(serialized_property)
        end
        output_object['status'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualMachineExtensionHandlerInstanceView] Deserialized
      # object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualMachineExtensionHandlerInstanceView.new

        deserialized_property = object['type']
        output_object.type = deserialized_property

        deserialized_property = object['typeHandlerVersion']
        output_object.type_handler_version = deserialized_property

        deserialized_property = object['status']
        unless deserialized_property.nil?
          deserialized_property = InstanceViewStatus.deserialize_object(deserialized_property)
        end
        output_object.status = deserialized_property

        output_object
      end
    end
  end
end
