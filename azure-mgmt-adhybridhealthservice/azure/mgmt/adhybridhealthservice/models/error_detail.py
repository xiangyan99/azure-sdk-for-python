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


class ErrorDetail(Model):
    """The error details.

    :param description: The error description.
    :type description: str
    :param kb_url: The knowledge base article url which contains more
     information about the error.
    :type kb_url: str
    :param detail: Additional details related to the error.
    :type detail: str
    :param objects_with_sync_error: The list of objects with sync errors.
    :type objects_with_sync_error:
     ~azure.mgmt.adhybridhealthservice.models.ObjectWithSyncError
    :param object_with_sync_error:  The object with sync error.
    :type object_with_sync_error:
     ~azure.mgmt.adhybridhealthservice.models.MergedExportError
    """

    _attribute_map = {
        'description': {'key': 'description', 'type': 'str'},
        'kb_url': {'key': 'kbUrl', 'type': 'str'},
        'detail': {'key': 'detail', 'type': 'str'},
        'objects_with_sync_error': {'key': 'objectsWithSyncError', 'type': 'ObjectWithSyncError'},
        'object_with_sync_error': {'key': 'objectWithSyncError', 'type': 'MergedExportError'},
    }

    def __init__(self, **kwargs):
        super(ErrorDetail, self).__init__(**kwargs)
        self.description = kwargs.get('description', None)
        self.kb_url = kwargs.get('kb_url', None)
        self.detail = kwargs.get('detail', None)
        self.objects_with_sync_error = kwargs.get('objects_with_sync_error', None)
        self.object_with_sync_error = kwargs.get('object_with_sync_error', None)
