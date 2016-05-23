# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes a reference to Key Vault Secret
    #
    class KeyVaultSecretReference

      include MsRestAzure

      # @return [String] Gets or sets the URL referencing a secret in a Key
      # Vault.
      attr_accessor :secret_url

      # @return [SubResource] Gets or sets the Relative URL of the Key Vault
      # containing the secret.
      attr_accessor :source_vault

      #
      # Validate the object. Throws ValidationError if validation fails.
      #
      def validate
        fail MsRest::ValidationError, 'property secret_url is nil' if @secret_url.nil?
        fail MsRest::ValidationError, 'property source_vault is nil' if @source_vault.nil?
        @source_vault.validate unless @source_vault.nil?
      end

      #
      # Serializes given Model object into Ruby Hash.
      # @param object Model object to serialize.
      # @return [Hash] Serialized object in form of Ruby Hash.
      #
      def self.serialize_object(object)
        object.validate
        output_object = {}

        serialized_property = object.secret_url
        output_object['secretUrl'] = serialized_property unless serialized_property.nil?

        serialized_property = object.source_vault
        unless serialized_property.nil?
          serialized_property = MsRestAzure::SubResource.serialize_object(serialized_property)
        end
        output_object['sourceVault'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [KeyVaultSecretReference] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = KeyVaultSecretReference.new

        deserialized_property = object['secretUrl']
        output_object.secret_url = deserialized_property

        deserialized_property = object['sourceVault']
        unless deserialized_property.nil?
          deserialized_property = MsRestAzure::SubResource.deserialize_object(deserialized_property)
        end
        output_object.source_vault = deserialized_property

        output_object
      end
    end
  end
end
