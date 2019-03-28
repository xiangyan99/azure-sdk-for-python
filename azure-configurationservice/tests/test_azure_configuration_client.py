# -------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
# --------------------------------------------------------------------------
import uuid
import pytest
from copy import copy
import os

from msrestazure.azure_exceptions import CloudError
from azure.configuration import AzureConfigurationClient
from azure.configuration._generated.models import KeyValue


from devtools_testutils import AzureMgmtTestCase

class AzConfigTestData:
    def __init__(self):
        self.label1 = None
        self.label2 = None
        self.label_uuid = None
        self.label1_data = []
        self.label2_data = []
        self.no_label_data = []
        self.quantity_each_label = 1 # three labels, each 34, 34 * 3 > 100. So the data will have multi pages to test
        self.page_size = 100 # page size of AzConfig


class AzConfigurationClientTest(AzureMgmtTestCase):

    def setUp(self):
        self.working_folder = os.path.dirname(__file__)
        super(AzConfigurationClientTest, self).setUp()

        connection_str = os.environ['APP_CONFIG_CONNECTION_STR']
        app_config_client = AzureConfigurationClient(connection_str)
        self.app_config_client = app_config_client

        label_uuid = str(uuid.uuid1())
        label1 = "test_label1_" + label_uuid
        label2 = "test_label2_" + label_uuid
        content_type = "test_content_type"

        test_data = AzConfigTestData()
        self.test_data = test_data
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

        # create a key_value object without label
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

    def tearDown(self):
        test_data = self.test_data
        app_config_client = self.app_config_client
        for kv in test_data.label1_data:
            app_config_client.delete_key_value(kv.key, label=kv.label)
        for kv in test_data.label2_data:
            app_config_client.delete_key_value(kv.key, label=kv.label)
        for kv in test_data.no_label_data:
            app_config_client.delete_key_value(kv.key)

    # method: add_key_value
    @record
    def test_add_key_value(self):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
    
        kv = KeyValue()
        kv.key = "unit_test_key_" + str(uuid.uuid1())
        kv.label = str(uuid.uuid1())
        kv.value = "test value"
        kv.content_type = "test content type"
        kv.tags = {"tag1": "tag1", "tag2": "tag2"}
        kv.etag = "not needed"  # this etag will not be processed.
        created_kv = self.app_config_client.add_key_value(kv)
        self.app_config_client.delete_key_value(kv.key, kv.label)
        assert (
            created_kv.label == kv.label
            and kv.value == kv.value
            and created_kv.content_type == kv.content_type
            and created_kv.tags == kv.tags
        )
        assert (
            created_kv.etag is not None
            and created_kv.last_modified is not None
            and created_kv.locked is False
        )
    
    
    def test_add_existing_key_value(self, app_config_client, key_value_data):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
        kv = KeyValue()
        compare_kv = key_value_data.label1_data[0]
        kv.key = compare_kv.key
        kv.label = compare_kv.label
        kv.value = compare_kv.value
        kv.content_type = compare_kv.content_type
    
        with pytest.raises(CloudError):
            app_config_client.add_key_value(kv)
    
    
    def test_add_key_value_no_label(self, app_config_client, key_value_data):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
        kv = KeyValue()
        kv.key = "unit_test_key_" + str(uuid.uuid1())
        # kv.label is None by default
        kv.value = "test value"
        kv.content_type = "test content type"
        kv.tags = {"tag1": "tag1", "tag2": "tag2"}
        kv.etag = "not needed"  # this etag will not be processed.
        created_kv = app_config_client.add_key_value(kv)
        app_config_client.delete_key_value(kv.key, kv.label)
        assert (
            kv.value == kv.value
            and created_kv.content_type == kv.content_type
            and created_kv.tags == kv.tags
        )
        assert (
            created_kv.etag is not None
            and created_kv.last_modified is not None
            and created_kv.locked is False
            and created_kv.label is None
        )
    
    
    def test_add_existing_key_value_no_label(self, app_config_client, key_value_data):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
        kv = KeyValue()
        compare_kv = key_value_data.no_label_data[0]
        kv.key = compare_kv.key
        kv.value = compare_kv.value
        kv.content_type = compare_kv.content_type
    
        with pytest.raises(CloudError):
            app_config_client.add_key_value(kv)
    
    
    # method: set_key_value
    def test_set_existing_key_value_no_label_etag(
        app_config_client, key_value_data
    ):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
        sample_kv = copy(key_value_data.no_label_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_set_kv = app_config_client.add_key_value(sample_kv)
        to_set_kv.value = to_set_kv.value + "a"
        to_set_kv.tags = {"a": "b", "c": "d"}
        set_kv = app_config_client.set_key_value(to_set_kv)
        # remove the new key value from the service
        app_config_client.delete_key_value(set_kv.key)
        assert (
            to_set_kv.key == set_kv.key
            and None is set_kv.label
            and to_set_kv.value == set_kv.value
            and to_set_kv.content_type == set_kv.content_type
            and to_set_kv.tags == set_kv.tags
            and to_set_kv.etag != set_kv.etag
        )
    
    
    def test_set_existing_key_value_label_etag(self, app_config_client, key_value_data):
        # type: (AzureConfigurationClient, AzConfigTestData) -> None
        sample_kv = copy(key_value_data.label1_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_set_kv = app_config_client.add_key_value(sample_kv)
        to_set_kv.value = to_set_kv.value + "a"
        to_set_kv.tags = {"a": "b", "c": "d"}
        set_kv = app_config_client.set_key_value(to_set_kv)
        # remove the new key value from the service
        app_config_client.delete_key_value(set_kv.key, label=set_kv.label)
        assert (
            to_set_kv.key == set_kv.key
            and to_set_kv.label == to_set_kv.label
            and to_set_kv.value == set_kv.value
            and to_set_kv.content_type == set_kv.content_type
            and to_set_kv.tags == set_kv.tags
            and to_set_kv.etag != set_kv.etag
        )
    
    
    def test_set_existing_key_value_label_wrong_etag(
        app_config_client, key_value_data
    ):
        sample_kv = copy(key_value_data.label1_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_set_kv = app_config_client.add_key_value(sample_kv)
        to_set_kv.value = to_set_kv.value + "a"
        to_set_kv.tags = {"a": "b", "c": "d"}
        to_set_kv.etag = "wrong etag"
        with pytest.raises(CloudError):
            app_config_client.set_key_value(to_set_kv)
        app_config_client.delete_key_value(to_set_kv.key, label=to_set_kv.label)
    
    
    def test_set_key_value_no_label_etag(
        app_config_client, key_value_data
    ):
        to_set_kv = copy(key_value_data.no_label_data[-1])
        to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
        with pytest.raises(CloudError):
            app_config_client.set_key_value(to_set_kv)
    
    
    def test_set_key_value_label_etag(
        app_config_client, key_value_data
    ):
        to_set_kv = copy(key_value_data.label1_data[-1])
        to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
        with pytest.raises(CloudError):
            app_config_client.set_key_value(to_set_kv)
    
    
    def test_set_key_value_no_label_no_etag(
        app_config_client, key_value_data
    ):
        to_set_kv = copy(key_value_data.no_label_data[-1])
        to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_set_kv.etag = None
        set_kv = app_config_client.set_key_value(to_set_kv)
        # remove immediately from the AzConfig service
        app_config_client.delete_key_value(set_kv.key)
        assert (
            to_set_kv.key == set_kv.key
            and None is set_kv.label
            and to_set_kv.value == set_kv.value
            and to_set_kv.content_type == set_kv.content_type
            and to_set_kv.tags == set_kv.tags
            and to_set_kv.etag != set_kv.etag
        )
    
    
    def test_set_key_value_label_no_etag(
        app_config_client, key_value_data
    ):
        to_set_kv = copy(key_value_data.label1_data[-1])
        to_set_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_set_kv.etag = None
        set_kv = app_config_client.set_key_value(to_set_kv)
        # remove immediately from the AzConfig service
        app_config_client.delete_key_value(set_kv.key, label=set_kv.label)
        assert (
            to_set_kv.key == set_kv.key
            and to_set_kv.label == set_kv.label
            and to_set_kv.value == set_kv.value
            and to_set_kv.content_type == set_kv.content_type
            and to_set_kv.tags == set_kv.tags
            and to_set_kv.etag != set_kv.etag
        )
    
    
    # method: update_key_value
    def test_update_existing_key_value_no_label_etag(
        app_config_client, key_value_data
    ):
        sample_kv = copy(key_value_data.no_label_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_update_kv = app_config_client.add_key_value(sample_kv)
        tags = {"a": "b", "c": "d"}
        updated_kv = app_config_client.update_key_value(
            to_update_kv.key, value="updated_value", tags=tags, etag=to_update_kv.etag
        )
        # remove the new key value from the service
        app_config_client.delete_key_value(updated_kv.key)
        assert (
            to_update_kv.key == updated_kv.key
            and None is updated_kv.label
            and "updated_value" == updated_kv.value
            and to_update_kv.content_type == updated_kv.content_type
            and tags == updated_kv.tags
            and to_update_kv.etag != updated_kv.etag
        )
    
    
    def test_update_existing_key_value_label_etag(
        app_config_client, key_value_data
    ):
        sample_kv = copy(key_value_data.label1_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_update_kv = app_config_client.add_key_value(sample_kv)
        tags = {"a": "b", "c": "d"}
        updated_kv = app_config_client.update_key_value(
            to_update_kv.key,
            label=to_update_kv.label,
            value="updated_value",
            tags=tags,
            etag=to_update_kv.etag,
        )
        # remove the new key value from the service
        app_config_client.delete_key_value(updated_kv.key, label=updated_kv.label)
        assert (
            to_update_kv.key == updated_kv.key
            and to_update_kv.label == updated_kv.label
            and "updated_value" == updated_kv.value
            and to_update_kv.content_type == updated_kv.content_type
            and tags == updated_kv.tags
            and to_update_kv.etag != updated_kv.etag
        )
    
    
    def test_update_existing_key_value_label_noetag(
        app_config_client, key_value_data
    ):
        sample_kv = copy(key_value_data.label1_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_update_kv = app_config_client.add_key_value(sample_kv)
        tags = {"a": "b", "c": "d"}
        updated_kv = app_config_client.update_key_value(
            to_update_kv.key, label=to_update_kv.label, value="updated_value", tags=tags
        )
        # remove the new key value from the service
        app_config_client.delete_key_value(updated_kv.key, label=updated_kv.label)
        assert (
            to_update_kv.key == updated_kv.key
            and to_update_kv.label == updated_kv.label
            and "updated_value" == updated_kv.value
            and to_update_kv.content_type == updated_kv.content_type
            and tags == updated_kv.tags
            and to_update_kv.etag != updated_kv.etag
        )
    
    
    def test_update_existing_key_value_label_wrong_etag(
        app_config_client, key_value_data
    ):
        sample_kv = copy(key_value_data.label1_data[-1])
    
        # create a new key value into AzConfig service
        sample_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_update_kv = app_config_client.add_key_value(sample_kv)
        tags = {"a": "b", "c": "d"}
        etag = "wrong etag"
        with pytest.raises(CloudError):
            app_config_client.update_key_value(
                to_update_kv.key,
                label=to_update_kv.label,
                value="updated_value",
                tags=tags,
                etag=etag,
            )
        app_config_client.delete_key_value(to_update_kv.key, label=to_update_kv.label)
    
    
    def test_update_no_existing_key_value_label_noetag(
        app_config_client, key_value_data
    ):
        key = str(uuid.uuid1())
        label = "test_label1"
        with pytest.raises(CloudError):
            app_config_client.update_key_value(key, label=label, value="some value")
    
    
    # method: get_key_value
    def test_get_key_value_no_label(self, app_config_client, key_value_data):
        compare_kv = key_value_data.no_label_data[0]
        fetched_kv = app_config_client.get_key_value(compare_kv.key)
        assert (
            fetched_kv.key == compare_kv.key
            and fetched_kv.value == compare_kv.value
            and fetched_kv.content_type == compare_kv.content_type
            and fetched_kv.tags == compare_kv.tags
        )
        assert fetched_kv.label is None
    
    
    def test_get_key_value_label(self, app_config_client, key_value_data):
        compare_kv = key_value_data.label1_data[0]
        fetched_kv = app_config_client.get_key_value(compare_kv.key, compare_kv.label)
        assert (
            fetched_kv.key == compare_kv.key
            and fetched_kv.value == compare_kv.value
            and fetched_kv.content_type == compare_kv.content_type
            and fetched_kv.tags == compare_kv.tags
        )
        assert fetched_kv.label is not None
    
    
    def test_get_non_existing_key_value(self, app_config_client, key_value_data):
        compare_kv = key_value_data.label1_data[0]
        with pytest.raises(CloudError):
            app_config_client.get_key_value(compare_kv.key, compare_kv.label + "a")
    
    
    # method: lock_key_value and unlock_key_value
    def test_lock_unlock_no_label(self, app_config_client, key_value_data):
        # lock, assert locked, then unlock and assert locked
        to_lock_kv = key_value_data.no_label_data[0]
        locked_kv = app_config_client.lock_key_value(to_lock_kv.key)
        assert locked_kv.locked is True
        unlocked_kv = app_config_client.unlock_key_value(to_lock_kv.key)
        assert unlocked_kv.locked is False
    
    
    def test_lock_unlock_with_label(self, app_config_client, key_value_data):
        # lock, assert locked, then unlock and assert locked
        to_lock_kv = key_value_data.label1_data[0]
        locked_kv = app_config_client.lock_key_value(to_lock_kv.key, to_lock_kv.label)
        assert locked_kv.locked is True
        unlocked_kv = app_config_client.unlock_key_value(to_lock_kv.key, to_lock_kv.label)
        assert unlocked_kv.locked is False
    
    
    def test_lock_no_existing(self, app_config_client, key_value_data):
        to_lock_kv = key_value_data.label1_data[0]
        with pytest.raises(CloudError):
            app_config_client.lock_key_value(to_lock_kv.key, to_lock_kv.label + "a")
    
    
    # method: delete_key_value
    def test_delete_with_key_no_label(self, app_config_client, key_value_data):
        to_delete_kv = copy(key_value_data.no_label_data[-1])
        to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_delete_kv = app_config_client.add_key_value(to_delete_kv)
        app_config_client.delete_key_value(to_delete_kv.key)
        with pytest.raises(CloudError):
            app_config_client.get_key_value(to_delete_kv.key)
    
    
    def test_delete_with_key_label(self, app_config_client, key_value_data):
        to_delete_kv = copy(key_value_data.label1_data[-1])
        to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_delete_kv = app_config_client.add_key_value(to_delete_kv)
        app_config_client.delete_key_value(to_delete_kv.key, label=to_delete_kv.label)
        with pytest.raises(CloudError):
            app_config_client.get_key_value(to_delete_kv.key, label=to_delete_kv.label)
    
    
    def test_delete_non_existing(self, app_config_client):
        deleted_kv = app_config_client.delete_key_value(str(uuid.uuid1()))
        assert deleted_kv is None
    
    
    def test_delete_correct_etag(self, app_config_client, key_value_data):
        to_delete_kv = copy(key_value_data.no_label_data[-1])
        to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_delete_kv = app_config_client.add_key_value(to_delete_kv)
        deleted_kv = app_config_client.delete_key_value(
            to_delete_kv.key, etag=to_delete_kv.etag
        )
        assert deleted_kv is not None
        with pytest.raises(CloudError):
            app_config_client.get_key_value(to_delete_kv.key)
    
    
    def test_delete_wrong_etag(self, app_config_client, key_value_data):
        to_delete_kv = copy(key_value_data.no_label_data[-1])
        to_delete_kv.key = "unit_test_key_" + str(uuid.uuid1())
        to_delete_kv = app_config_client.add_key_value(to_delete_kv)
        with pytest.raises(CloudError):
            app_config_client.delete_key_value(to_delete_kv.key, etag="wrong etag")
        app_config_client.delete_key_value(to_delete_kv.key)
    
    
    # method: list_key_values
    def test_list_key_values_key_label(self, app_config_client, key_value_data):
        to_list1 = key_value_data.label1_data[0]
        to_list2 = key_value_data.label2_data[0]
        items = app_config_client.list_key_values(
            labels=[to_list1.label, to_list2.label], keys=[to_list1.key, to_list2.key]
        )
        cnt = 0
        for kv in items:
            assert kv.key in [to_list1.key, to_list2.key] and kv.label in [
                to_list1.label,
                to_list2.label,
            ]
            cnt += 1
        assert cnt == 2
    
    
    def test_list_key_values_only_label(self, app_config_client, key_value_data):
        items = app_config_client.list_key_values(labels=[key_value_data.label1])
        cnt = 0
        for kv in items:
            assert kv.label == key_value_data.label1
            cnt += 1
        assert cnt == key_value_data.quantity_each_label
    
    
    def test_list_key_values_key_no_label(self, app_config_client, key_value_data):
        to_list1 = key_value_data.no_label_data[0]
        items = app_config_client.list_key_values(keys=[to_list1.key])
        cnt = 0
        for kv in items:
            assert kv.key == to_list1.key
            cnt += 1
        assert cnt == 1
    
    
    def test_list_key_values_fields(self, app_config_client, key_value_data):
        items = app_config_client.list_key_values(
            keys=["*"], labels=[key_value_data.label1], fields=["key", "content_type"]
        )
        cnt = 0
        for kv in items:
            assert kv.key is not None and kv.label is None and kv.content_type is not None
            cnt += 1
        assert cnt == key_value_data.quantity_each_label
    
    
    def test_list_key_values_correct_etag(self, app_config_client, key_value_data):
        to_list_kv = key_value_data.label1_data[0]
        custom_headers = {"If-Match": to_list_kv.etag}
        items = app_config_client.list_key_values(
            keys=[to_list_kv.key], labels=[to_list_kv.label], headers=custom_headers
        )
        cnt = 0
        for kv in items:
            assert kv.key == to_list_kv.key and kv.label == to_list_kv.label
            cnt += 1
        assert cnt == 1
    
    
    """
    key_value_data.quantity_each_label*3 must be over page size (100 by default) to have multi page
    """
    
    
    def test_list_key_values_multi_pages(self, app_config_client, key_value_data):
        items = app_config_client.list_key_values(
            keys=["*"], labels=[key_value_data.label1, key_value_data.label2, "\0"]
        )
        cnt = 0
        for kv in items:
            assert kv.label is None or kv.label in [
                key_value_data.label1,
                key_value_data.label2,
                None,
            ]
            cnt += 1
        assert cnt >= key_value_data.quantity_each_label * 3
    
    
    # method: list_revisions
    def test_list_revisions_key_label(self, app_config_client, key_value_data):
        to_list1 = key_value_data.label1_data[0]
        to_list2 = key_value_data.label2_data[0]
        items = app_config_client.list_revisions(
            labels=[to_list1.label, to_list2.label], keys=[to_list1.key, to_list2.key]
        )
        cnt = 0
        for kv in items:
            assert kv.key in [to_list1.key, to_list2.key] and kv.label in [
                to_list1.label,
                to_list2.label,
            ]
            cnt += 1
        assert cnt >= 2
    
    
    def test_list_revisions_only_label(self, app_config_client, key_value_data):
        items = app_config_client.list_revisions(labels=[key_value_data.label1])
        cnt = 0
        for kv in items:
            assert kv.label == key_value_data.label1
            cnt += 1
        assert cnt >= key_value_data.quantity_each_label
    
    
    def test_list_revisions_key_no_label(self, app_config_client, key_value_data):
        to_list1 = key_value_data.no_label_data[0]
        items = app_config_client.list_revisions(keys=[to_list1.key])
        cnt = 0
        for kv in items:
            assert kv.key == to_list1.key
            cnt += 1
        assert cnt >= 1
    
    
    def test_list_revisions_fields(self, app_config_client, key_value_data):
        items = app_config_client.list_revisions(
            keys=["*"], labels=[key_value_data.label1], fields=["key", "content_type"]
        )
        for kv in items:
            assert (
                kv.key is not None
                and kv.label is None
                and kv.content_type is not None
                and not kv.tags
                and not kv.etag
            )
    
    
    def test_list_revisions_correct_etag(self, app_config_client, key_value_data):
        to_list_kv = key_value_data.label1_data[0]
        custom_headers = {"If-Match": to_list_kv.etag}
        items = app_config_client.list_revisions(
            keys=[to_list_kv.key], labels=[to_list_kv.label], headers=custom_headers
        )
        cnt = 0
        for kv in items:
            assert kv.key == to_list_kv.key and kv.label == to_list_kv.label
            cnt += 1
        assert cnt > 0
    
    
    def test_list_revisions_multi_pages(self, app_config_client, key_value_data):
        items = app_config_client.list_revisions(
            keys=["*"], labels=[key_value_data.label1, key_value_data.label2, "\0"]
        )
        cnt = 0
        for kv in items:
            assert kv.label in [key_value_data.label1, key_value_data.label2, None]
            cnt += 1
        assert (
            cnt >= key_value_data.quantity_each_label * 3
        ), "There is no way to list_key_values with both label and no label"
