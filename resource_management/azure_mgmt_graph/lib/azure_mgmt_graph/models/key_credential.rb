# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Graph
  module Models
    #
    # Active Directory service principal Key Credential information
    #
    class KeyCredential

      include MsRestAzure

      # @return [DateTime] Gets or sets start date
      attr_accessor :start_date

      # @return [DateTime] Gets or sets end date
      attr_accessor :end_date

      # @return [String] Gets or sets value
      attr_accessor :value

      # @return [String] Gets or sets key Id
      attr_accessor :key_id

      # @return [String] Gets or sets usage
      attr_accessor :usage

      # @return [String] Gets or sets type
      attr_accessor :type

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

        serialized_property = object.start_date
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['startDate'] = serialized_property unless serialized_property.nil?

        serialized_property = object.end_date
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['endDate'] = serialized_property unless serialized_property.nil?

        serialized_property = object.value
        output_object['value'] = serialized_property unless serialized_property.nil?

        serialized_property = object.key_id
        output_object['keyId'] = serialized_property unless serialized_property.nil?

        serialized_property = object.usage
        output_object['usage'] = serialized_property unless serialized_property.nil?

        serialized_property = object.type
        output_object['type'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [KeyCredential] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = KeyCredential.new

        deserialized_property = object['startDate']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.start_date = deserialized_property

        deserialized_property = object['endDate']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.end_date = deserialized_property

        deserialized_property = object['value']
        output_object.value = deserialized_property

        deserialized_property = object['keyId']
        output_object.key_id = deserialized_property

        deserialized_property = object['usage']
        output_object.usage = deserialized_property

        deserialized_property = object['type']
        output_object.type = deserialized_property

        output_object
      end
    end
  end
end
