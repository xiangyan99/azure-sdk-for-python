# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # The response body contains the status of the specified asynchronous
    # operation, indicating whether it has succeeded, is inprogress, or has
    # failed. Note that this status is distinct from the HTTP status code
    # returned for the Get Operation Status operation itself. If the
    # asynchronous operation succeeded, the response body includes the HTTP
    # status code for the successful request. If the asynchronous operation
    # failed, the response body includes the HTTP status code for the failed
    # request and error information regarding the failure.
    #
    class AzureAsyncOperationResult

      include MsRestAzure

      # @return [NetworkOperationStatus] Status of the AzureAsuncOperation.
      # Possible values include: 'InProgress', 'Succeeded', 'Failed'
      attr_accessor :status

      # @return [Error]
      attr_accessor :error

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @error.validate unless @error.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.status
        output_object['status'] = serialized_property unless serialized_property.nil?

        serialized_property = object.error
        unless serialized_property.nil?
          serialized_property = Error.serialize_object(serialized_property)
        end
        output_object['error'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [AzureAsyncOperationResult] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = AzureAsyncOperationResult.new

        deserialized_property = object['status']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = NetworkOperationStatus.constants.any? { |e| NetworkOperationStatus.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum NetworkOperationStatus does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.status = deserialized_property

        deserialized_property = object['error']
        unless deserialized_property.nil?
          deserialized_property = Error.deserialize_object(deserialized_property)
        end
        output_object.error = deserialized_property

        output_object
      end
    end
  end
end
