# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Scheduler
  module Models
    #
    # Model object.
    #
    class JobHistoryDefinitionProperties

      include MsRestAzure

      # @return [DateTime] Gets the start time for this job.
      attr_accessor :start_time

      # @return [DateTime] Gets the end time for this job.
      attr_accessor :end_time

      # @return [DateTime] Gets the expected execution time for this job.
      attr_accessor :expected_execution_time

      # @return [JobHistoryActionName] Gets the job history action name.
      # Possible values include: 'MainAction', 'ErrorAction'
      attr_accessor :action_name

      # @return [JobExecutionStatus] Gets the job history status. Possible
      # values include: 'Completed', 'Failed', 'Postponed'
      attr_accessor :status

      # @return [String] Gets the message for the job history.
      attr_accessor :message

      # @return [Integer] Gets the retry count for job.
      attr_accessor :retry_count

      # @return [Integer] Gets the repeat count for the job.
      attr_accessor :repeat_count

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

        serialized_property = object.start_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['startTime'] = serialized_property unless serialized_property.nil?

        serialized_property = object.end_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['endTime'] = serialized_property unless serialized_property.nil?

        serialized_property = object.expected_execution_time
        serialized_property = serialized_property.new_offset(0).strftime('%FT%TZ')
        output_object['expectedExecutionTime'] = serialized_property unless serialized_property.nil?

        serialized_property = object.action_name
        output_object['actionName'] = serialized_property unless serialized_property.nil?

        serialized_property = object.status
        output_object['status'] = serialized_property unless serialized_property.nil?

        serialized_property = object.message
        output_object['message'] = serialized_property unless serialized_property.nil?

        serialized_property = object.retry_count
        output_object['retryCount'] = serialized_property unless serialized_property.nil?

        serialized_property = object.repeat_count
        output_object['repeatCount'] = serialized_property unless serialized_property.nil?

        output_object
      end

      #
      # Deserializes given Ruby Hash into Model object.
      # @param object [Hash] Ruby Hash object to deserialize.
      # @return [JobHistoryDefinitionProperties] Deserialized object.
      #
      def self.deserialize_object(object)
        return if object.nil?
        output_object = JobHistoryDefinitionProperties.new

        deserialized_property = object['startTime']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.start_time = deserialized_property

        deserialized_property = object['endTime']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.end_time = deserialized_property

        deserialized_property = object['expectedExecutionTime']
        deserialized_property = DateTime.parse(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.expected_execution_time = deserialized_property

        deserialized_property = object['actionName']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = JobHistoryActionName.constants.any? { |e| JobHistoryActionName.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum JobHistoryActionName does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.action_name = deserialized_property

        deserialized_property = object['status']
        if (!deserialized_property.nil? && !deserialized_property.empty?)
          enum_is_valid = JobExecutionStatus.constants.any? { |e| JobExecutionStatus.const_get(e).to_s.downcase == deserialized_property.downcase }
          warn 'Enum JobExecutionStatus does not contain ' + deserialized_property.downcase + ', but was received from the server.' unless enum_is_valid
        end
        output_object.status = deserialized_property

        deserialized_property = object['message']
        output_object.message = deserialized_property

        deserialized_property = object['retryCount']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.retry_count = deserialized_property

        deserialized_property = object['repeatCount']
        deserialized_property = Integer(deserialized_property) unless deserialized_property.to_s.empty?
        output_object.repeat_count = deserialized_property

        output_object
      end
    end
  end
end
