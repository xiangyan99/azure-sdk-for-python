# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Specifies the list of virtual machine scale set instance IDs.
    #
    class VirtualMachineScaleSetVMInstanceIDs

      include MsRestAzure

      # @return [Array<String>] Gets or sets the virtual machine scale set
      # instance ids.
      attr_accessor :instance_ids

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @instance_ids.each{ |e| e.validate if e.respond_to?(:validate) } unless @instance_ids.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.instance_ids
        output_object['instanceIds'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualMachineScaleSetVMInstanceIDs] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualMachineScaleSetVMInstanceIDs.new

        deserialized_property = object['instanceIds']
        output_object.instance_ids = deserialized_property

        output_object
      end
    end
  end
end
