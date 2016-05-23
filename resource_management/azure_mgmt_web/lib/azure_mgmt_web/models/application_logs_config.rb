# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  module Models
    #
    # Application logs configuration
    #
    class ApplicationLogsConfig

      include MsRestAzure

      # @return [FileSystemApplicationLogsConfig] Application logs to file
      # system configuration
      attr_accessor :file_system

      # @return [AzureTableStorageApplicationLogsConfig] Application logs to
      # azure table storage configuration
      attr_accessor :azure_table_storage

      # @return [AzureBlobStorageApplicationLogsConfig] Application logs to
      # blob storage configuration
      attr_accessor :azure_blob_storage

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        @file_system.validate unless @file_system.nil?
        @azure_table_storage.validate unless @azure_table_storage.nil?
        @azure_blob_storage.validate unless @azure_blob_storage.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.file_system
        unless serialized_property.nil?
          serialized_property = FileSystemApplicationLogsConfig.serialize_object(serialized_property)
        end
        output_object['fileSystem'] = serialized_property unless serialized_property.nil?

        serialized_property = object.azure_table_storage
        unless serialized_property.nil?
          serialized_property = AzureTableStorageApplicationLogsConfig.serialize_object(serialized_property)
        end
        output_object['azureTableStorage'] = serialized_property unless serialized_property.nil?

        serialized_property = object.azure_blob_storage
        unless serialized_property.nil?
          serialized_property = AzureBlobStorageApplicationLogsConfig.serialize_object(serialized_property)
        end
        output_object['azureBlobStorage'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [ApplicationLogsConfig] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = ApplicationLogsConfig.new

        deserialized_property = object['fileSystem']
        unless deserialized_property.nil?
          deserialized_property = FileSystemApplicationLogsConfig.deserialize_object(deserialized_property)
        end
        output_object.file_system = deserialized_property

        deserialized_property = object['azureTableStorage']
        unless deserialized_property.nil?
          deserialized_property = AzureTableStorageApplicationLogsConfig.deserialize_object(deserialized_property)
        end
        output_object.azure_table_storage = deserialized_property

        deserialized_property = object['azureBlobStorage']
        unless deserialized_property.nil?
          deserialized_property = AzureBlobStorageApplicationLogsConfig.deserialize_object(deserialized_property)
        end
        output_object.azure_blob_storage = deserialized_property

        output_object
      end
    end
  end
end
