# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Model object.
    #
    class UsageProperties

      include MsRestAzure

      # @return [String] Friendly name shown in the UI
      attr_accessor :display_name

      # @return [String] Name of the quota
      attr_accessor :name

      # @return [String] Name of the quota resource
      attr_accessor :resource_name

      # @return [String] Units of measurement for the quota resource
      attr_accessor :unit

      # @return [Integer] The current value of the resource counter
      attr_accessor :current_value

      # @return [Integer] The resource limit
      attr_accessor :limit

      # @return [DateTime] Next reset time for the resource counter
      attr_accessor :next_reset_time

      # @return [ComputeModeOptions] ComputeMode used for this usage. Possible
      # values include: 'Shared', 'Dedicated', 'Dynamic'
      attr_accessor :compute_mode

      # @return [String] SiteMode used for this usage
      attr_accessor :site_mode

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.display_name
        output_object['displayName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.name
        output_object['name'] = serialized_property unless serialized_property.nil?

        serialized_property = object.resource_name
        output_object['resourceName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.unit
        output_object['unit'] = serialized_property unless serialized_property.nil?

        serialized_property = object.current_value
        output_object['currentValue'] = serialized_property unless serialized_property.nil?

        serialized_property = object.limit
        output_object['limit'] = serialized_property unless serialized_property.nil?

        serialized_property = object.next_reset_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['nextResetTime'] = serialized_property unless serialized_property.nil?

        serialized_property = object.compute_mode
        output_object['computeMode'] = serialized_property unless serialized_property.nil?

        serialized_property = object.site_mode
        output_object['siteMode'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [UsageProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = UsageProperties.new

        deserialized_property = object['displayName']
        output_object.display_name = deserialized_property

        deserialized_property = object['name']
        output_object.name = deserialized_property

        deserialized_property = object['resourceName']
        output_object.resource_name = deserialized_property

        deserialized_property = object['unit']
        output_object.unit = deserialized_property

        deserialized_property = object['currentValue']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.current_value = deserialized_property

        deserialized_property = object['limit']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.limit = deserialized_property

        deserialized_property = object['nextResetTime']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.next_reset_time = deserialized_property

        deserialized_property = object['computeMode']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = ComputeModeOptions.constants.any? { |e| ComputeModeOptions.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum ComputeModeOptions does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.compute_mode = deserialized_property

        deserialized_property = object['siteMode']
        output_object.site_mode = deserialized_property

        output_object
      end
    end
  end
end
