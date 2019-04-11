# coding=utf-8
# --------------------------------------------------------------------------
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from msrest.pipeline import ClientRawResponse
from msrestazure.azure_exceptions import CloudError
from ... import models
import uuid


class AzureConfigurationClientImpOperationsMixin:

    def list_key_values(
            self, label=None, key=None, accept_date_time=None, fields=None, *, custom_headers=None, raw=False, **operation_config):
        """List key values.

        List the key values in the configuration store, optionally filtered by
        label.

        :param label: Filter returned values based on their label. '*' can be
         used as wildcard in the beginning or end of the filter
        :type label: list[str]
        :param key: Filter returned values based on their keys. '*' can be
         used as wildcard in the beginning or end of the filter
        :type key: list[str]
        :param accept_date_time: Obtain representation of the result related
         to past time.
        :type accept_date_time: datetime
        :param fields: Specify which fields to return
        :type fields: list[str]
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: An iterator like instance of KeyValue
        :rtype: ~azconfig.models.KeyValuePaged[~azconfig.models.KeyValue]
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        def prepare_request(next_link=None):
            if not next_link:
                # Construct URL
                url = self.list_key_values.metadata['url']

                # Construct parameters
                query_parameters = {}
                if label is not None:
                    query_parameters['label'] = self._serialize.query("label", label, '[str]', div=',', max_items=5)
                if key is not None:
                    query_parameters['key'] = self._serialize.query("key", key, '[str]', div=',')
                if fields is not None:
                    query_parameters['fields'] = self._serialize.query("fields", fields, '[str]', div=',')

            else:
                url = next_link
                query_parameters = {}

            # Construct headers
            header_parameters = {}
            header_parameters['Accept'] = 'application/json'
            if self.config.generate_client_request_id:
                header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
            if custom_headers:
                header_parameters.update(custom_headers)
            if accept_date_time is not None:
                header_parameters['Accept-DateTime'] = self._serialize.header("accept_date_time", accept_date_time, 'iso-8601')
            if self.config.accept_language is not None:
                header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

            # Construct and send request
            request = self._client.get(url, query_parameters, header_parameters)
            return request

        def internal_paging(next_link=None):
            request = prepare_request(next_link)

            response = self._client.send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        async def internal_paging_async(next_link=None):
            request = prepare_request(next_link)

            response = await self._client.async_send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        # Deserialize response
        header_dict = None
        if raw:
            header_dict = {}
        deserialized = models.KeyValuePaged(
            internal_paging, self._deserialize.dependencies, header_dict, async_command=internal_paging_async)

        return deserialized
    list_key_values.metadata = {'url': '/kv'}

    async def get_key_value(
            self, key, label="%00", accept_date_time=None, *, custom_headers=None, raw=False, **operation_config):
        """Get a KeyValue.

        Get the KeyValue for the given key and label.

        :param key: string
        :type key: str
        :param label: Label of key to retreive
        :type label: str
        :param accept_date_time: Obtain representation of the result related
         to past time.
        :type accept_date_time: datetime
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: KeyValue or ClientRawResponse if raw=true
        :rtype: ~azconfig.models.KeyValue or
         ~msrest.pipeline.ClientRawResponse
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        # Construct URL
        url = self.get_key_value.metadata['url']
        path_format_arguments = {
            'key': self._serialize.url("key", key, 'str')
        }
        url = self._client.format_url(url, **path_format_arguments)

        # Construct parameters
        query_parameters = {}
        if label is not None:
            query_parameters['label'] = self._serialize.query("label", label, 'str')

        # Construct headers
        header_parameters = {}
        header_parameters['Accept'] = 'application/json'
        if self.config.generate_client_request_id:
            header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
        if custom_headers:
            header_parameters.update(custom_headers)
        if accept_date_time is not None:
            header_parameters['Accept-DateTime'] = self._serialize.header("accept_date_time", accept_date_time, 'iso-8601')
        if self.config.accept_language is not None:
            header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

        # Construct and send request
        request = self._client.get(url, query_parameters, header_parameters)
        response = await self._client.async_send(request, stream=False, **operation_config)

        if response.status_code not in [200, 304]:
            exp = CloudError(response)
            exp.request_id = response.headers.get('x-ms-request-id')
            raise exp

        header_dict = {}
        deserialized = None
        if response.status_code == 200:
            deserialized = self._deserialize('KeyValue', response)
            header_dict = {
                'Last-Modified': 'str',
            }

        if raw:
            client_raw_response = ClientRawResponse(deserialized, response)
            client_raw_response.add_headers(header_dict)
            return client_raw_response

        return deserialized
    get_key_value.metadata = {'url': '/kv/{key}'}

    async def create_or_update_key_value(
            self, key_value, key, label="%00", *, custom_headers=None, raw=False, **operation_config):
        """Create (or update) a KeyValue.

        Create (or update) a KeyValue.

        :param key_value:
        :type key_value: ~azconfig.models.KeyValue
        :param key: string
        :type key: str
        :param label:
        :type label: str
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: KeyValue or ClientRawResponse if raw=true
        :rtype: ~azconfig.models.KeyValue or
         ~msrest.pipeline.ClientRawResponse
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        # Construct URL
        url = self.create_or_update_key_value.metadata['url']
        path_format_arguments = {
            'key': self._serialize.url("key", key, 'str')
        }
        url = self._client.format_url(url, **path_format_arguments)

        # Construct parameters
        query_parameters = {}
        if label is not None:
            query_parameters['label'] = self._serialize.query("label", label, 'str')

        # Construct headers
        header_parameters = {}
        header_parameters['Accept'] = 'application/json'
        header_parameters['Content-Type'] = 'application/json; charset=utf-8'
        if self.config.generate_client_request_id:
            header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
        if custom_headers:
            header_parameters.update(custom_headers)
        if self.config.accept_language is not None:
            header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

        # Construct body
        body_content = self._serialize.body(key_value, 'KeyValue')

        # Construct and send request
        request = self._client.put(url, query_parameters, header_parameters, body_content)
        response = await self._client.async_send(request, stream=False, **operation_config)

        if response.status_code not in [200]:
            exp = CloudError(response)
            exp.request_id = response.headers.get('x-ms-request-id')
            raise exp

        deserialized = None
        if response.status_code == 200:
            deserialized = self._deserialize('KeyValue', response)

        if raw:
            client_raw_response = ClientRawResponse(deserialized, response)
            return client_raw_response

        return deserialized
    create_or_update_key_value.metadata = {'url': '/kv/{key}'}

    async def delete_key_value(
            self, key, label=None, *, custom_headers=None, raw=False, **operation_config):
        """Delete a KeyValue.

        :param key: string
        :type key: str
        :param label:
        :type label: str
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: KeyValue or ClientRawResponse if raw=true
        :rtype: ~azconfig.models.KeyValue or
         ~msrest.pipeline.ClientRawResponse
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        # Construct URL
        url = self.delete_key_value.metadata['url']
        path_format_arguments = {
            'key': self._serialize.url("key", key, 'str')
        }
        url = self._client.format_url(url, **path_format_arguments)

        # Construct parameters
        query_parameters = {}
        if label is not None:
            query_parameters['label'] = self._serialize.query("label", label, 'str')

        # Construct headers
        header_parameters = {}
        header_parameters['Accept'] = 'application/json'
        if self.config.generate_client_request_id:
            header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
        if custom_headers:
            header_parameters.update(custom_headers)
        if self.config.accept_language is not None:
            header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

        # Construct and send request
        request = self._client.delete(url, query_parameters, header_parameters)
        response = await self._client.async_send(request, stream=False, **operation_config)

        if response.status_code not in [200, 204]:
            exp = CloudError(response)
            exp.request_id = response.headers.get('x-ms-request-id')
            raise exp

        deserialized = None
        if response.status_code == 200:
            deserialized = self._deserialize('KeyValue', response)

        if raw:
            client_raw_response = ClientRawResponse(deserialized, response)
            return client_raw_response

        return deserialized
    delete_key_value.metadata = {'url': '/kv/{key}'}

    def list_keys(
            self, name=None, accept_date_time=None, *, custom_headers=None, raw=False, **operation_config):
        """

        :param name:
        :type name: str
        :param accept_date_time: Obtain representation of the result related
         to past time.
        :type accept_date_time: datetime
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: An iterator like instance of Key
        :rtype: ~azconfig.models.KeyPaged[~azconfig.models.Key]
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        def prepare_request(next_link=None):
            if not next_link:
                # Construct URL
                url = self.list_keys.metadata['url']

                # Construct parameters
                query_parameters = {}
                if name is not None:
                    query_parameters['name'] = self._serialize.query("name", name, 'str')

            else:
                url = next_link
                query_parameters = {}

            # Construct headers
            header_parameters = {}
            header_parameters['Accept'] = 'application/json'
            if self.config.generate_client_request_id:
                header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
            if custom_headers:
                header_parameters.update(custom_headers)
            if accept_date_time is not None:
                header_parameters['Accept-DateTime'] = self._serialize.header("accept_date_time", accept_date_time, 'iso-8601')
            if self.config.accept_language is not None:
                header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

            # Construct and send request
            request = self._client.get(url, query_parameters, header_parameters)
            return request

        def internal_paging(next_link=None):
            request = prepare_request(next_link)

            response = self._client.send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        async def internal_paging_async(next_link=None):
            request = prepare_request(next_link)

            response = await self._client.async_send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        # Deserialize response
        header_dict = None
        if raw:
            header_dict = {}
        deserialized = models.KeyPaged(
            internal_paging, self._deserialize.dependencies, header_dict, async_command=internal_paging_async)

        return deserialized
    list_keys.metadata = {'url': '/keys'}

    def list_labels(
            self, accept_date_time=None, fields=None, name=None, *, custom_headers=None, raw=False, **operation_config):
        """List labels.

        :param accept_date_time: Obtain representation of the result related
         to past time.
        :type accept_date_time: datetime
        :param fields: Specify which fields to return
        :type fields: list[str]
        :param name:
        :type name: str
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: An iterator like instance of Label
        :rtype: ~azconfig.models.LabelPaged[~azconfig.models.Label]
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        def prepare_request(next_link=None):
            if not next_link:
                # Construct URL
                url = self.list_labels.metadata['url']

                # Construct parameters
                query_parameters = {}
                if fields is not None:
                    query_parameters['fields'] = self._serialize.query("fields", fields, '[str]', div=',')
                if name is not None:
                    query_parameters['name'] = self._serialize.query("name", name, 'str')

            else:
                url = next_link
                query_parameters = {}

            # Construct headers
            header_parameters = {}
            header_parameters['Accept'] = 'application/json'
            if self.config.generate_client_request_id:
                header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
            if custom_headers:
                header_parameters.update(custom_headers)
            if accept_date_time is not None:
                header_parameters['Accept-DateTime'] = self._serialize.header("accept_date_time", accept_date_time, 'iso-8601')
            if self.config.accept_language is not None:
                header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

            # Construct and send request
            request = self._client.get(url, query_parameters, header_parameters)
            return request

        def internal_paging(next_link=None):
            request = prepare_request(next_link)

            response = self._client.send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        async def internal_paging_async(next_link=None):
            request = prepare_request(next_link)

            response = await self._client.async_send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        # Deserialize response
        header_dict = None
        if raw:
            header_dict = {}
        deserialized = models.LabelPaged(
            internal_paging, self._deserialize.dependencies, header_dict, async_command=internal_paging_async)

        return deserialized
    list_labels.metadata = {'url': '/labels'}

    async def lock_key_value(
            self, key, label=None, *, custom_headers=None, raw=False, **operation_config):
        """

        :param key:
        :type key: str
        :param label:
        :type label: str
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: KeyValue or ClientRawResponse if raw=true
        :rtype: ~azconfig.models.KeyValue or
         ~msrest.pipeline.ClientRawResponse
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        # Construct URL
        url = self.lock_key_value.metadata['url']
        path_format_arguments = {
            'key': self._serialize.url("key", key, 'str')
        }
        url = self._client.format_url(url, **path_format_arguments)

        # Construct parameters
        query_parameters = {}
        if label is not None:
            query_parameters['label'] = self._serialize.query("label", label, 'str')

        # Construct headers
        header_parameters = {}
        header_parameters['Accept'] = 'application/json'
        if self.config.generate_client_request_id:
            header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
        if custom_headers:
            header_parameters.update(custom_headers)
        if self.config.accept_language is not None:
            header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

        # Construct and send request
        request = self._client.put(url, query_parameters, header_parameters)
        response = await self._client.async_send(request, stream=False, **operation_config)

        if response.status_code not in [200]:
            exp = CloudError(response)
            exp.request_id = response.headers.get('x-ms-request-id')
            raise exp

        deserialized = None
        if response.status_code == 200:
            deserialized = self._deserialize('KeyValue', response)

        if raw:
            client_raw_response = ClientRawResponse(deserialized, response)
            return client_raw_response

        return deserialized
    lock_key_value.metadata = {'url': '/locks/{key}'}

    async def unlock_key_value(
            self, key, label=None, *, custom_headers=None, raw=False, **operation_config):
        """

        :param key:
        :type key: str
        :param label:
        :type label: str
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: KeyValue or ClientRawResponse if raw=true
        :rtype: ~azconfig.models.KeyValue or
         ~msrest.pipeline.ClientRawResponse
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        # Construct URL
        url = self.unlock_key_value.metadata['url']
        path_format_arguments = {
            'key': self._serialize.url("key", key, 'str')
        }
        url = self._client.format_url(url, **path_format_arguments)

        # Construct parameters
        query_parameters = {}
        if label is not None:
            query_parameters['label'] = self._serialize.query("label", label, 'str')

        # Construct headers
        header_parameters = {}
        header_parameters['Accept'] = 'application/json'
        if self.config.generate_client_request_id:
            header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
        if custom_headers:
            header_parameters.update(custom_headers)
        if self.config.accept_language is not None:
            header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

        # Construct and send request
        request = self._client.delete(url, query_parameters, header_parameters)
        response = await self._client.async_send(request, stream=False, **operation_config)

        if response.status_code not in [200]:
            exp = CloudError(response)
            exp.request_id = response.headers.get('x-ms-request-id')
            raise exp

        deserialized = None
        if response.status_code == 200:
            deserialized = self._deserialize('KeyValue', response)

        if raw:
            client_raw_response = ClientRawResponse(deserialized, response)
            return client_raw_response

        return deserialized
    unlock_key_value.metadata = {'url': '/locks/{key}'}

    def list_revisions(
            self, label=None, key=None, fields=None, accept_date_time=None, *, custom_headers=None, raw=False, **operation_config):
        """

        :param label: Filter returned values based on their label. '*' can be
         used as wildcard in the beginning or end of the filter
        :type label: list[str]
        :param key: Filter returned values based on their keys. '*' can be
         used as wildcard in the beginning or end of the filter
        :type key: list[str]
        :param fields: Specify which fields to return
        :type fields: list[str]
        :param accept_date_time: Obtain representation of the result related
         to past time.
        :type accept_date_time: datetime
        :param dict custom_headers: headers that will be added to the request
        :param bool raw: returns the direct response alongside the
         deserialized response
        :param operation_config: :ref:`Operation configuration
         overrides<msrest:optionsforoperations>`.
        :return: An iterator like instance of KeyValue
        :rtype: ~azconfig.models.KeyValuePaged[~azconfig.models.KeyValue]
        :raises: :class:`CloudError<msrestazure.azure_exceptions.CloudError>`
        """
        def prepare_request(next_link=None):
            if not next_link:
                # Construct URL
                url = self.list_revisions.metadata['url']

                # Construct parameters
                query_parameters = {}
                if label is not None:
                    query_parameters['label'] = self._serialize.query("label", label, '[str]', div=',', max_items=5)
                if key is not None:
                    query_parameters['key'] = self._serialize.query("key", key, '[str]', div=',')
                if fields is not None:
                    query_parameters['fields'] = self._serialize.query("fields", fields, '[str]', div=',')

            else:
                url = next_link
                query_parameters = {}

            # Construct headers
            header_parameters = {}
            header_parameters['Accept'] = 'application/json'
            if self.config.generate_client_request_id:
                header_parameters['x-ms-client-request-id'] = str(uuid.uuid1())
            if custom_headers:
                header_parameters.update(custom_headers)
            if accept_date_time is not None:
                header_parameters['Accept-DateTime'] = self._serialize.header("accept_date_time", accept_date_time, 'iso-8601')
            if self.config.accept_language is not None:
                header_parameters['accept-language'] = self._serialize.header("self.config.accept_language", self.config.accept_language, 'str')

            # Construct and send request
            request = self._client.get(url, query_parameters, header_parameters)
            return request

        def internal_paging(next_link=None):
            request = prepare_request(next_link)

            response = self._client.send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        async def internal_paging_async(next_link=None):
            request = prepare_request(next_link)

            response = await self._client.async_send(request, stream=False, **operation_config)

            if response.status_code not in [200]:
                exp = CloudError(response)
                exp.request_id = response.headers.get('x-ms-request-id')
                raise exp

            return response

        # Deserialize response
        header_dict = None
        if raw:
            header_dict = {}
        deserialized = models.KeyValuePaged(
            internal_paging, self._deserialize.dependencies, header_dict, async_command=internal_paging_async)

        return deserialized
    list_revisions.metadata = {'url': '/revisions'}
