#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#--------------------------------------------------------------------------
import os
import pytest
import uuid
import logging
from azure.configuration import AzureConfigurationClient
from azure.configuration._generated.models import KeyValue

#logging.basicConfig(level=logging.DEBUG, filemode='w', filename="c:/work/logging/azconfig_unittest.log")


class AzConfigTestData():
    def __init__(self):
        self.label1 = None
        self.label2 = None
        self.label_uuid = None
        self.label1_data = []
        self.label2_data = []
        self.no_label_data = []
        self.quantity_each_label = 34 # three labels, each 34, 34 * 3 > 100. So the data will have multi pages to test
        self.page_size = 100 # page size of AzConfig


@pytest.fixture(scope="module")
def app_config_client():
    # [START create_app_configuration_client]
    import os
    from azure.configuration import AzureConfigurationClient

    connection_str = os.environ['APP_CONFIG_CONNECTION_STR']

    # Create a new app configuration client using SAS credentials
    app_config_client = AzureConfigurationClient(connection_str)

    # [END create_app_configuration_client]

    return app_config_client


@pytest.fixture(scope="module", name="key_value_data")
def prepare_key_value_data(app_config_client):
    label_uuid = str(uuid.uuid1())
    label1 = "test_label1_" + label_uuid
    label2 = "test_label2_" + label_uuid
    content_type = "test_content_type"

    test_data = AzConfigTestData()
    test_data.label_uuid = label_uuid
    test_data.label1 = label1
    test_data.label2 = label2

    for i in range(test_data.quantity_each_label):
        kv = KeyValue()
        kv.key = "test_key_" + str(uuid.uuid1())
        kv.value = "test_value"
        kv.label = label1
        kv.content_type = content_type
        kv.tags = {
            "tag1": "tag1",
            "tag2": "tag2"
        }
        test_data.label1_data.append(app_config_client.add_key_value(kv))
    
    for i in range(test_data.quantity_each_label):
        kv = KeyValue()
        kv.key = "test_key_" + str(uuid.uuid1())
        kv.value = "test_value"
        kv.label = label2
        kv.content_type = content_type
        kv.tags = {
            "tag1": "tag1",
            "tag2": "tag2"
        }

        test_data.label2_data.append(app_config_client.add_key_value(kv))


    #create a key_value object without label
    for i in range(test_data.quantity_each_label):
        kv = KeyValue()
        kv.key = "test_key_" + str(uuid.uuid1())
        kv.value = "test_value"
        kv.content_type = content_type
        kv.tags = {
            "tag1": "tag1",
            "tag2": "tag2"
        }
        test_data.no_label_data.append(app_config_client.add_key_value(kv))

    yield test_data

    # tear down. remove the created data from app config service
    for kv in test_data.label1_data:
        app_config_client.delete_key_value(kv.key, label=kv.label)
    for kv in test_data.label2_data:
        app_config_client.delete_key_value(kv.key, label=kv.label)
    for kv in test_data.no_label_data:
        app_config_client.delete_key_value(kv.key)

