# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Web
  #
  # Use these APIs to manage Azure Websites resources through the Azure
  # Resource Manager. All task operations conform to the HTTP/1.1 protocol
  # specification and each operation returns an x-ms-request-id header that
  # can be used to obtain information about the request. You must make sure
  # that requests made to these resources are secure. For more information,
  # see <a
  # href="https://msdn.microsoft.com/en-us/library/azure/dn790557.aspx">Authenticating
  # Azure Resource Manager requests.</a>
  #
  class GlobalCertificateOrder
    include Azure::ARM::Web::Models
    include MsRestAzure

    #
    # Creates and initializes a new instance of the GlobalCertificateOrder class.
    # @param client service class for accessing basic functionality.
    #
    def initialize(client)
      @client = client
    end

    # @return reference to the WebSiteManagementClient
    attr_reader :client

    #
    # Lists all domains in a subscription
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [CertificateOrderCollection] operation results.
    #
    def get_all_certificate_orders(custom_headers = nil)
      response = get_all_certificate_orders_async(custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Lists all domains in a subscription
    #
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def get_all_certificate_orders_with_http_info(custom_headers = nil)
      get_all_certificate_orders_async(custom_headers).value!
    end

    #
    # Lists all domains in a subscription
    #
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def get_all_certificate_orders_async(custom_headers = nil)
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.CertificateRegistration/certificateOrders'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :get, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?
        # Deserialize Response
        if status_code == 200
          begin
            parsed_response = response_content.to_s.empty? ? nil : JSON.load(response_content)
            unless parsed_response.nil?
              parsed_response = CertificateOrderCollection.deserialize_object(parsed_response)
            end
            result.body = parsed_response
          rescue Exception => e
            fail MsRest::DeserializationError.new('Error occurred in deserializing the response', e.message, e.backtrace, result)
          end
        end

        result
      end

      promise.execute
    end

    #
    # Validate certificate purchase information
    #
    # @param certificate_order [CertificateOrder] Certificate order
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [Object] operation results.
    #
    def validate_certificate_purchase_information(certificate_order, custom_headers = nil)
      response = validate_certificate_purchase_information_async(certificate_order, custom_headers).value!
      response.body unless response.nil?
    end

    #
    # Validate certificate purchase information
    #
    # @param certificate_order [CertificateOrder] Certificate order
    # @param custom_headers [Hash{String => String}] A hash of custom headers that
    # will be added to the HTTP request.
    #
    # @return [MsRestAzure::AzureOperationResponse] HTTP response information.
    #
    def validate_certificate_purchase_information_with_http_info(certificate_order, custom_headers = nil)
      validate_certificate_purchase_information_async(certificate_order, custom_headers).value!
    end

    #
    # Validate certificate purchase information
    #
    # @param certificate_order [CertificateOrder] Certificate order
    # @param [Hash{String => String}] A hash of custom headers that will be added
    # to the HTTP request.
    #
    # @return [Concurrent::Promise] Promise object which holds the HTTP response.
    #
    def validate_certificate_purchase_information_async(certificate_order, custom_headers = nil)
      fail ArgumentError, 'certificate_order is nil' if certificate_order.nil?
      certificate_order.validate unless certificate_order.nil?
      fail ArgumentError, '@client.subscription_id is nil' if @client.subscription_id.nil?
      fail ArgumentError, '@client.api_version is nil' if @client.api_version.nil?
      request_headers = {}

      # Set Headers
      request_headers['x-ms-client-request-id'] = SecureRandom.uuid
      request_headers['accept-language'] = @client.accept_language unless @client.accept_language.nil?

      # Serialize Request
      request_headers['Content-Type'] = 'application/json; charset=utf-8'
      unless certificate_order.nil?
        certificate_order = CertificateOrder.serialize_object(certificate_order)
      end
      request_content = certificate_order != nil ? JSON.generate(certificate_order, quirks_mode: true) : nil
      path_template = '/subscriptions/{subscriptionId}/providers/Microsoft.CertificateRegistration/validateCertificateRegistrationInformation'
      options = {
          middlewares: [[MsRest::RetryPolicyMiddleware, times: 3, retry: 0.02], [:cookie_jar]],
          path_params: {'subscriptionId' => @client.subscription_id},
          query_params: {'api-version' => @client.api_version},
          body: request_content,
          headers: request_headers.merge(custom_headers || {})
      }

      request_url = @base_url || @client.base_url

      request = MsRest::HttpOperationRequest.new(request_url, path_template, :post, options)
      promise = request.run_promise do |req|
        @client.credentials.sign_request(req) unless @client.credentials.nil?
      end

      promise = promise.then do |http_response|
        status_code = http_response.status
        response_content = http_response.body
        unless status_code == 200
          error_model = JSON.load(response_content)
          fail MsRestAzure::AzureOperationError.new(request, http_response, error_model)
        end

        # Create Result
        result = MsRestAzure::AzureOperationResponse.new(request, http_response)
        result.request_id = http_response['x-ms-request-id'] unless http_response['x-ms-request-id'].nil?

        result
      end

      promise.execute
    end

  end
end
