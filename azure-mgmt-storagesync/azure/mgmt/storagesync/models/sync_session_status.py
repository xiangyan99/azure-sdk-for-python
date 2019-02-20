# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
#
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.
# --------------------------------------------------------------------------

from msrest.serialization import Model


class SyncSessionStatus(Model):
    """Sync Session status object.

    Variables are only populated by the server, and will be ignored when
    sending a request.

    :ivar last_sync_result: Last sync result (HResult)
    :vartype last_sync_result: int
    :ivar last_sync_timestamp: Last sync timestamp
    :vartype last_sync_timestamp: datetime
    :ivar last_sync_success_timestamp: Last sync success timestamp
    :vartype last_sync_success_timestamp: datetime
    :param last_sync_per_item_error_count: Last sync per item error count.
    :type last_sync_per_item_error_count: long
    :ivar persistent_files_not_syncing_count: Count of persistent files not
     syncing. Reserved for future use.
    :vartype persistent_files_not_syncing_count: long
    :ivar transient_files_not_syncing_count: Count of transient files not
     syncing. Reserved for future use.
    :vartype transient_files_not_syncing_count: long
    :ivar files_not_syncing_errors: Array of per-item errors coming from the
     last sync session. Reserved for future use.
    :vartype files_not_syncing_errors:
     list[~azure.mgmt.storagesync.models.FilesNotSyncingError]
    """

    _validation = {
        'last_sync_result': {'readonly': True},
        'last_sync_timestamp': {'readonly': True},
        'last_sync_success_timestamp': {'readonly': True},
        'persistent_files_not_syncing_count': {'readonly': True},
        'transient_files_not_syncing_count': {'readonly': True},
        'files_not_syncing_errors': {'readonly': True},
    }

    _attribute_map = {
        'last_sync_result': {'key': 'lastSyncResult', 'type': 'int'},
        'last_sync_timestamp': {'key': 'lastSyncTimestamp', 'type': 'iso-8601'},
        'last_sync_success_timestamp': {'key': 'lastSyncSuccessTimestamp', 'type': 'iso-8601'},
        'last_sync_per_item_error_count': {'key': 'lastSyncPerItemErrorCount', 'type': 'long'},
        'persistent_files_not_syncing_count': {'key': 'persistentFilesNotSyncingCount', 'type': 'long'},
        'transient_files_not_syncing_count': {'key': 'transientFilesNotSyncingCount', 'type': 'long'},
        'files_not_syncing_errors': {'key': 'filesNotSyncingErrors', 'type': '[FilesNotSyncingError]'},
    }

    def __init__(self, **kwargs):
        super(SyncSessionStatus, self).__init__(**kwargs)
        self.last_sync_result = None
        self.last_sync_timestamp = None
        self.last_sync_success_timestamp = None
        self.last_sync_per_item_error_count = kwargs.get('last_sync_per_item_error_count', None)
        self.persistent_files_not_syncing_count = None
        self.transient_files_not_syncing_count = None
        self.files_not_syncing_errors = None
