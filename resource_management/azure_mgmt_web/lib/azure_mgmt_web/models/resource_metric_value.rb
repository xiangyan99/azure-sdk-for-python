# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Value of resource metric
    #
    class ResourceMetricValue

      include MsRestAzure

      # @return [String] Value timestamp
      attr_accessor :time_stamp

      # @return [Float] Value average
      attr_accessor :average

      # @return [Float] Value minimum
      attr_accessor :minimum

      # @return [Float] Value maximum
      attr_accessor :maximum

      # @return [Float] Value total
      attr_accessor :total

      # @return [Float] Value count
      attr_accessor :count

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

        serialized_property = object.time_stamp
        output_object['timeStamp'] = serialized_property unless serialized_property.nil?

        serialized_property = object.average
        output_object['average'] = serialized_property unless serialized_property.nil?

        serialized_property = object.minimum
        output_object['minimum'] = serialized_property unless serialized_property.nil?

        serialized_property = object.maximum
        output_object['maximum'] = serialized_property unless serialized_property.nil?

        serialized_property = object.total
        output_object['total'] = serialized_property unless serialized_property.nil?

        serialized_property = object.count
        output_object['count'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ResourceMetricValue] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ResourceMetricValue.new

        deserialized_property = object['timeStamp']
        output_object.time_stamp = deserialized_property

        deserialized_property = object['average']
        deserialized_property = Float(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.average = deserialized_property

        deserialized_property = object['minimum']
        deserialized_property = Float(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.minimum = deserialized_property

        deserialized_property = object['maximum']
        deserialized_property = Float(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.maximum = deserialized_property

        deserialized_property = object['total']
        deserialized_property = Float(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.total = deserialized_property

        deserialized_property = object['count']
        deserialized_property = Float(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.count = deserialized_property

        output_object
      end
    end
  end
end
