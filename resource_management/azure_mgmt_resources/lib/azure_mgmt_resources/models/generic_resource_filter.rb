# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Resources
  module Models
    #
    # Resource filter.
    #
    class GenericResourceFilter

      include MsRestAzure

      # @return [String] Gets or sets the resource type.
      attr_accessor :resource_type

      # @return [String] Gets or sets the tag name.
      attr_accessor :tagname

      # @return [String] Gets or sets the tag value.
      attr_accessor :tagvalue

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

        serialized_property = object.resource_type
        output_object['resourceType'] = serialized_property unless serialized_property.nil?

        serialized_property = object.tagname
        output_object['tagname'] = serialized_property unless serialized_property.nil?

        serialized_property = object.tagvalue
        output_object['tagvalue'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [GenericResourceFilter] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = GenericResourceFilter.new

        deserialized_property = object['resourceType']
        output_object.resource_type = deserialized_property

        deserialized_property = object['tagname']
        output_object.tagname = deserialized_property

        deserialized_property = object['tagvalue']
        output_object.tagvalue = deserialized_property

        output_object
      end
    end
  end
end
