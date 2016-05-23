# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Represents database connection string information
    #
    class ConnStringInfo

      include MsRestAzure

      # @return [String] Name of connection string
      attr_accessor :name

      # @return [String] Connection string value
      attr_accessor :connection_string

      # @return [DatabaseServerType] Type of database. Possible values
      # include: 'MySql', 'SQLServer', 'SQLAzure', 'Custom'
      attr_accessor :type

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property type is nil' if @type.nil?
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

        serialized_property = object.name
        output_object['name'] = serialized_property unless serialized_property.nil?

        serialized_property = object.connection_string
        output_object['connectionString'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ConnStringInfo] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ConnStringInfo.new

        deserialized_property = object['type']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = DatabaseServerType.constants.any? { |e| DatabaseServerType.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum DatabaseServerType does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.type = deserialized_property

        deserialized_property = object['name']
        output_object.name = deserialized_property

        deserialized_property = object['connectionString']
        output_object.connection_string = deserialized_property

        output_object
      end
    end
  end
end
