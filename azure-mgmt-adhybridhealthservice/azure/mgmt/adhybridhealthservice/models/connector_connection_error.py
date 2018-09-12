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


class ConnectorConnectionError(Model):
    """The connector connection error.

    :param id: The error Id.
    :type id: str
    :param run_step_result_id: The run step result Id.
    :type run_step_result_id: str
    :param connector_id: The connector Id.
    :type connector_id: str
    :param type: The type of error.
    :type type: str
    :param error_code: The error code.
    :type error_code: str
    :param message: The message for the connection error.
    :type message: str
    :param time_occured: The time when the connection error occured.
    :type time_occured: datetime
    :param server: The server where the connection error happened.
    :type server: str
    """

    _attribute_map = {
        'id': {'key': 'id', 'type': 'str'},
        'run_step_result_id': {'key': 'runStepResultId', 'type': 'str'},
        'connector_id': {'key': 'connectorId', 'type': 'str'},
        'type': {'key': 'type', 'type': 'str'},
        'error_code': {'key': 'errorCode', 'type': 'str'},
        'message': {'key': 'message', 'type': 'str'},
        'time_occured': {'key': 'timeOccured', 'type': 'iso-8601'},
        'server': {'key': 'server', 'type': 'str'},
    }

    def __init__(self, **kwargs):
        super(ConnectorConnectionError, self).__init__(**kwargs)
        self.id = kwargs.get('id', None)
        self.run_step_result_id = kwargs.get('run_step_result_id', None)
        self.connector_id = kwargs.get('connector_id', None)
        self.type = kwargs.get('type', None)
        self.error_code = kwargs.get('error_code', None)
        self.message = kwargs.get('message', None)
        self.time_occured = kwargs.get('time_occured', None)
        self.server = kwargs.get('server', None)
