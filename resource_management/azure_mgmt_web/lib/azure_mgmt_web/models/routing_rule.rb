# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Routing rules for TiP
    #
    class RoutingRule

      include MsRestAzure

      # @return [String] Name of the routing rule. The recommended name would
      # be to point to the slot which will receive the traffic in the
      # experiment.
      attr_accessor :name

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

        serialized_property = object.name
        output_object['name'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [RoutingRule] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = RoutingRule.new

        deserialized_property = object['name']
        output_object.name = deserialized_property

        output_object
      end
    end
  end
end
