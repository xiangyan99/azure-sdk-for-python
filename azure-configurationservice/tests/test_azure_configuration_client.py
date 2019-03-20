#-------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#--------------------------------------------------------------------------
import uuid
import pytest
import logging

from msrestazure.azure_exceptions import CloudError
from azure.configuration import AzureConfigurationClient
from azure.configuration._generated.models import KeyValue

from conftest import AzConfigTestData
from copy import copy


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


# method: add_key_value
def test_add_key_value_with_label_no_conflict(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    kv = KeyValue()
    compare_kv = key_value_data.label1_data[0]
    kv.key = "unit_test_key_" + str(uuid.uuid1())
    kv.label = compare_kv.label
    kv.value = compare_kv.value
    kv.content_type = compare_kv.content_type
    
    created_kv = app_config_client.add_key_value(kv)
    app_config_client.delete_key_value(kv.key, kv.label)
    assert created_kv.label == compare_kv.label and created_kv.value == compare_kv.value and created_kv.content_type == compare_kv.content_type


def test_add_key_value_with_label_with_conflict(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    kv = KeyValue()
    compare_kv = key_value_data.label1_data[0]
    kv.key = compare_kv.key
    kv.label = compare_kv.label
    kv.value = compare_kv.value
    kv.content_type = compare_kv.content_type

    with pytest.raises(CloudError):
        app_config_client.add_key_value(kv)


def test_add_key_value_without_label_no_conflict(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    kv = KeyValue()
    compare_kv = key_value_data.no_label_data[0]
    kv.key = "unit_test_key_" + str(uuid.uuid1())
    kv.value = compare_kv.value
    kv.content_type = compare_kv.content_type

    created_kv = app_config_client.add_key_value(kv)
    app_config_client.delete_key_value(kv.key)
    assert created_kv.value == compare_kv.value and created_kv.content_type == compare_kv.content_type
    assert created_kv.label is None


def test_add_key_value_without_label_with_conflict(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    kv = KeyValue()
    compare_kv = key_value_data.no_label_data[0]
    kv.key = compare_kv.key
    kv.value = compare_kv.value
    kv.content_type = compare_kv.content_type

    with pytest.raises(CloudError) as cloud_error:
        app_config_client.add_key_value(kv)

#TODO: test_add_key_value_with_etag()

# method: set_key_value
def test_set_key_value_existing_with_key_no_label_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.no_label_data[-1])

    #create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_set_kv = app_config_client.add_key_value(sample_kv)
    to_set_kv.value = to_set_kv.value + "a"
    to_set_kv.tags = {"a": "b", "c": "d"}
    set_kv = app_config_client.set_key_value(to_set_kv)
    #remove the new key value from the service
    app_config_client.delete_key_value(set_kv.key)
    assert to_set_kv.key == set_kv.key and None is set_kv.label and to_set_kv.value == set_kv.value \
        and to_set_kv.content_type == set_kv.content_type and to_set_kv.tags == set_kv.tags and to_set_kv.etag != set_kv.etag


def test_set_key_value_existing_with_key_label_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.label1_data[-1])

    # create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_set_kv = app_config_client.add_key_value(sample_kv)
    to_set_kv.value = to_set_kv.value + "a"
    to_set_kv.tags = {"a": "b", "c": "d"}
    set_kv = app_config_client.set_key_value(to_set_kv)
    # remove the new key value from the service
    app_config_client.delete_key_value(set_kv.key, label=set_kv.label)
    assert to_set_kv.key == set_kv.key and to_set_kv.label == to_set_kv.label and to_set_kv.value == set_kv.value \
        and to_set_kv.content_type == set_kv.content_type and to_set_kv.tags == set_kv.tags and to_set_kv.etag != set_kv.etag


def test_set_key_value_existing_with_key_label_wrong_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.label1_data[-1])

    # create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_set_kv = app_config_client.add_key_value(sample_kv)
    to_set_kv.value = to_set_kv.value + "a"
    to_set_kv.tags = {"a": "b", "c": "d"}
    to_set_kv.etag = "wrong etag"
    with pytest.raises(CloudError):
        app_config_client.set_key_value(to_set_kv)
    app_config_client.delete_key_value(to_set_kv.key, label=to_set_kv.label)

def test_set_key_value_non_existing_with_key_nolabel_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_set_kv = copy(key_value_data.no_label_data[-1])
    to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
    with pytest.raises(CloudError):
        app_config_client.set_key_value(to_set_kv)


def test_set_key_value_non_existing_with_key_label_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_set_kv = copy(key_value_data.label1_data[-1])
    to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
    with pytest.raises(CloudError):
        app_config_client.set_key_value(to_set_kv)


def test_set_key_value_non_existing_with_key_no_label_no_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_set_kv = copy(key_value_data.no_label_data[-1])
    to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_set_kv.etag = None
    set_kv = app_config_client.set_key_value(to_set_kv)
    # remove immediately from the AzConfig service
    app_config_client.delete_key_value(set_kv.key)
    assert to_set_kv.key == set_kv.key and None is set_kv.label and to_set_kv.value == set_kv.value \
        and to_set_kv.content_type == set_kv.content_type and to_set_kv.tags == set_kv.tags and to_set_kv.etag != set_kv.etag


def test_set_key_value_non_existing_with_key_label_no_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_set_kv = copy(key_value_data.label1_data[-1])
    to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_set_kv.etag = None
    set_kv = app_config_client.set_key_value(to_set_kv)
    # remove immediately from the AzConfig service
    app_config_client.delete_key_value(set_kv.key, label=set_kv.label)
    assert to_set_kv.key == set_kv.key and to_set_kv.label == set_kv.label and to_set_kv.value == set_kv.value \
        and to_set_kv.content_type == set_kv.content_type and to_set_kv.tags == set_kv.tags and to_set_kv.etag != set_kv.etag


# method: update_key_value
#TODO: add test cases for update_key_value
def test_update_key_value_existing_with_key_nolabel_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.no_label_data[-1])

    #create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_update_kv = app_config_client.add_key_value(sample_kv)
    tags = {"a": "b", "c": "d"}
    updated_kv = app_config_client.update_key_value(to_update_kv.key, value="updated_value", tags=tags, etag=to_update_kv.etag)
    #remove the new key value from the service
    app_config_client.delete_key_value(updated_kv.key)
    assert to_update_kv.key == updated_kv.key and None is updated_kv.label and "updated_value" == updated_kv.value \
        and to_update_kv.content_type == updated_kv.content_type and tags == updated_kv.tags and to_update_kv.etag != updated_kv.etag


def test_update_key_value_existing_with_key_label_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.label1_data[-1])

    #create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_update_kv = app_config_client.add_key_value(sample_kv)
    tags = {"a": "b", "c": "d"}
    updated_kv = app_config_client.update_key_value(to_update_kv.key, label=to_update_kv.label, value="updated_value", tags=tags, etag=to_update_kv.etag)
    #remove the new key value from the service
    app_config_client.delete_key_value(updated_kv.key, label=updated_kv.label)
    assert to_update_kv.key == updated_kv.key and to_update_kv.label == updated_kv.label and "updated_value" == updated_kv.value \
        and to_update_kv.content_type == updated_kv.content_type and tags == updated_kv.tags and to_update_kv.etag != updated_kv.etag


def test_update_key_value_existing_with_key_label_noetag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.label1_data[-1])

    #create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_update_kv = app_config_client.add_key_value(sample_kv)
    tags = {"a": "b", "c": "d"}
    updated_kv = app_config_client.update_key_value(to_update_kv.key, label=to_update_kv.label, value="updated_value", tags=tags)
    #remove the new key value from the service
    app_config_client.delete_key_value(updated_kv.key, label=updated_kv.label)
    assert to_update_kv.key == updated_kv.key and to_update_kv.label == updated_kv.label and "updated_value" == updated_kv.value \
        and to_update_kv.content_type == updated_kv.content_type and tags == updated_kv.tags and to_update_kv.etag != updated_kv.etag


def test_update_key_value_existing_with_key_label_wrong_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    sample_kv = copy(key_value_data.label1_data[-1])

    #create a new key value into AzConfig service
    sample_kv.key = "unit_test_key_"+str(uuid.uuid1())
    to_update_kv = app_config_client.add_key_value(sample_kv)
    tags = {"a": "b", "c": "d"}
    etag = "wrong etag"
    with pytest.raises(CloudError):
        app_config_client.update_key_value(to_update_kv.key, label=to_update_kv.label, value="updated_value", tags=tags, etag=etag)
    app_config_client.delete_key_value(to_update_kv.key, label=to_update_kv.label)


def test_update_key_value_non_existing_with_key_label_noetag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    key = str(uuid.uuid1())
    label = "test_label1"
    with pytest.raises(CloudError):
        app_config_client.update_key_value(key, label=label, value="some value")


# method: get_key_value
def test_get_key_value_with_key_no_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    compare_kv = key_value_data.no_label_data[0]
    fetched_kv = app_config_client.get_key_value(compare_kv.key)
    assert fetched_kv.key == compare_kv.key and fetched_kv.value == compare_kv.value \
        and fetched_kv.content_type == compare_kv.content_type and fetched_kv.tags == compare_kv.tags
    assert fetched_kv.label is None


def test_get_key_value_with_key_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    compare_kv = key_value_data.label1_data[0]
    fetched_kv = app_config_client.get_key_value(compare_kv.key, compare_kv.label)
    assert fetched_kv.key == compare_kv.key and fetched_kv.value == compare_kv.value \
           and fetched_kv.content_type == compare_kv.content_type and fetched_kv.tags == compare_kv.tags
    assert fetched_kv.label is not None


def test_get_key_value_non_existing(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    compare_kv = key_value_data.label1_data[0]
    with pytest.raises(CloudError):
        app_config_client.get_key_value(compare_kv.key, compare_kv.label+"a")


# method: lock_key_value and unlock_key_value
def test_lock_unlock_with_key_no_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    # lock, assert locked, then unlock and assert locked
    to_lock_kv = key_value_data.no_label_data[0]
    locked_kv = app_config_client.lock_key_value(to_lock_kv.key)
    assert locked_kv.locked is True
    unlocked_kv = app_config_client.unlock_key_value(to_lock_kv.key)
    assert unlocked_kv.locked is False


def test_lock_unlock_with_key_and_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    # lock, assert locked, then unlock and assert locked
    to_lock_kv = key_value_data.label1_data[0]
    locked_kv = app_config_client.lock_key_value(to_lock_kv.key, to_lock_kv.label)
    assert locked_kv.locked is True
    unlocked_kv = app_config_client.unlock_key_value(to_lock_kv.key, to_lock_kv.label)
    assert unlocked_kv.locked is False


def test_lock_non_existing(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_lock_kv = key_value_data.label1_data[0]
    with pytest.raises(CloudError):
        app_config_client.lock_key_value(to_lock_kv.key, to_lock_kv.label + "a")


# method: delete_key_value
def test_delete_with_key_no_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_delete_kv = copy(key_value_data.no_label_data[-1])
    to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_delete_kv = app_config_client.add_key_value(to_delete_kv)
    app_config_client.delete_key_value(to_delete_kv.key)
    with pytest.raises(CloudError):
        app_config_client.get_key_value(to_delete_kv.key)


def test_delete_with_key_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_delete_kv = copy(key_value_data.label1_data[-1])
    to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_delete_kv = app_config_client.add_key_value(to_delete_kv)
    app_config_client.delete_key_value(to_delete_kv.key, label=to_delete_kv.label)
    with pytest.raises(CloudError):
        app_config_client.get_key_value(to_delete_kv.key, label=to_delete_kv.label)


def test_delete_non_existing(app_config_client: AzureConfigurationClient):
    deleted_kv = app_config_client.delete_key_value(str(uuid.uuid1()))
    assert deleted_kv is None


def test_delete_correct_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_delete_kv = copy(key_value_data.no_label_data[-1])
    to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_delete_kv = app_config_client.add_key_value(to_delete_kv)
    deleted_kv = app_config_client.delete_key_value(to_delete_kv.key, etag=to_delete_kv.etag)
    assert deleted_kv is not None
    with pytest.raises(CloudError):
        app_config_client.get_key_value(to_delete_kv.key)


def test_delete_wrong_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_delete_kv = copy(key_value_data.no_label_data[-1])
    to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
    to_delete_kv = app_config_client.add_key_value(to_delete_kv)
    with pytest.raises(CloudError):
        app_config_client.delete_key_value(to_delete_kv.key, etag="wrong etag")
    app_config_client.delete_key_value(to_delete_kv.key)


# method: list_key_values
def test_list_key_values_key_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list1 = key_value_data.label1_data[0]
    to_list2 = key_value_data.label2_data[0]
    items = app_config_client.list_key_values(labels=[to_list1.label, to_list2.label], keys = [to_list1.key, to_list2.key])
    cnt = sum(1 for x in items)
    assert cnt == 2


def test_list_key_values_only_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_key_values(labels=[key_value_data.label1])
    cnt = sum(1 for x in items)
    assert cnt == key_value_data.quantity_each_label


def test_list_key_values_key_no_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list1 = key_value_data.no_label_data[0]
    items = app_config_client.list_key_values(keys=[to_list1.key])
    cnt = sum(1 for x in items)
    assert cnt == 1


def test_list_key_values_fields(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_key_values(keys=['*'], labels=[key_value_data.label1], fields=['key', 'content_type'])
    for kv in items:
        assert kv.key is not None and kv.label is None and kv.content_type is not None


def test_list_key_values_correct_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list_kv = key_value_data.label1_data[0]
    custom_headers = {"If-Match": to_list_kv.etag}
    items = app_config_client.list_key_values(keys=[to_list_kv.key], labels=[to_list_kv.label], custom_headers=custom_headers)
    cnt = sum(1 for x in items)
    assert cnt == 1


def test_list_key_values_multi_pages(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_key_values(keys=['*'], labels=[''])
    cnt = sum(1 for x in items)
    logging.debug(f'number of items: {cnt}')
    assert cnt == key_value_data.quantity_each_label * 3


# method: list_revisions
def test_list_revisions_key_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list1 = key_value_data.label1_data[0]
    to_list2 = key_value_data.label2_data[0]
    items = app_config_client.list_revisions(labels=[to_list1.label, to_list2.label], keys = [to_list1.key, to_list2.key])
    cnt = sum(1 for x in items)
    assert cnt == 2


def test_list_revisions_only_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_revisions(labels=[key_value_data.label1])
    cnt = sum(1 for x in items)
    assert cnt > 0


def test_list_revisions_key_no_label(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list1 = key_value_data.no_label_data[0]
    items = app_config_client.list_revisions(keys=[to_list1.key])
    cnt = sum(1 for x in items)
    assert cnt == 1


def test_list_revisions_fields(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_revisions(keys=['*'], labels=[key_value_data.label1], fields=['key', 'content_type'])
    for kv in items:
        assert kv.key is not None and kv.label is None and kv.content_type is not None


def test_list_revisions_correct_etag(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    to_list_kv = key_value_data.label1_data[0]
    custom_headers = {"If-Match": to_list_kv.etag}
    items = app_config_client.list_revisions(keys=[to_list_kv.key], labels=[to_list_kv.label], custom_headers=custom_headers)
    cnt = sum(1 for x in items)
    assert cnt == 1


def test_list_revisions_multi_pages(app_config_client: AzureConfigurationClient, key_value_data: AzConfigTestData):
    items = app_config_client.list_revisions(keys=['*'], labels=[''])
    cnt = sum(1 for x in items)
    assert cnt == key_value_data.quantity_each_label * 3

