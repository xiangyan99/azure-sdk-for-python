# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes the properties of a Virtual Machine Extension Image.
    #
    class VirtualMachineExtensionImageProperties

      include MsRestAzure

      # @return [String] Gets or sets the operating system this extension
      # supports.
      attr_accessor :operating_system

      # @return [String] Gets or sets the type of role (IaaS or PaaS) this
      # extension supports.
      attr_accessor :compute_role

      # @return [String] Gets or sets the schema defined by publisher, where
      # extension consumers should provide settings in a matching schema.
      attr_accessor :handler_schema

      # @return [Boolean] Gets or sets whether the extension can be used on
      # xRP VMScaleSets.By default existing extensions are usable on
      # scalesets, but there might be cases where a publisher wants to
      # explicitly indicate the extension is only enabled for CRP VMs but not
      # VMSS.
      attr_accessor :vm_scale_set_enabled

      # @return [Boolean] Gets or sets whether the handler can support
      # multiple extensions.
      attr_accessor :supports_multiple_extensions

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property operating_system is nil' if @operating_system.nil?
        fail MsRest::ValidationError, 'property compute_role is nil' if @compute_role.nil?
        fail MsRest::ValidationError, 'property handler_schema is nil' if @handler_schema.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.operating_system
        output_object['operatingSystem'] = serialized_property unless serialized_property.nil?

        serialized_property = object.compute_role
        output_object['computeRole'] = serialized_property unless serialized_property.nil?

        serialized_property = object.handler_schema
        output_object['handlerSchema'] = serialized_property unless serialized_property.nil?

        serialized_property = object.vm_scale_set_enabled
        output_object['vmScaleSetEnabled'] = serialized_property unless serialized_property.nil?

        serialized_property = object.supports_multiple_extensions
        output_object['supportsMultipleExtensions'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [VirtualMachineExtensionImageProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = VirtualMachineExtensionImageProperties.new

        deserialized_property = object['operatingSystem']
        output_object.operating_system = deserialized_property

        deserialized_property = object['computeRole']
        output_object.compute_role = deserialized_property

        deserialized_property = object['handlerSchema']
        output_object.handler_schema = deserialized_property

        deserialized_property = object['vmScaleSetEnabled']
        output_object.vm_scale_set_enabled = deserialized_property

        deserialized_property = object['supportsMultipleExtensions']
        output_object.supports_multiple_extensions = deserialized_property

        output_object
      end
    end
  end
end
