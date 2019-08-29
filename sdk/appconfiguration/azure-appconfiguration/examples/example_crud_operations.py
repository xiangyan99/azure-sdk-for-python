# -------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
# --------------------------------------------------------------------------

from azure.appconfiguration import ConfigurationSetting, AzureAppConfigurationClient

def main():
    #create app config client
    connection_string = "YOUR CONNECTION STRING"
    client = AzureAppConfigurationClient.from_connection_string(connection_string)

    #add configuration setting
    config_setting = ConfigurationSetting(
        key="MyKey",
        label="MyLabel",
        value="my value",
        content_type="my content type",
        tags={"my tag": "my tag value"},
    )
    added_config_setting = client.set_configuration_setting(config_setting)

    #get configuration setting
    fetched_config_setting = client.get_configuration_setting(
        key="MyKey", label="MyLabel"
    )

    #update configuration setting
    new_config_setting = ConfigurationSetting(
        key="MyKey",
        label="MyLabel",
        value="my updated value",
        content_type="my content type",
        tags={"my updated tag": "my updated tag value"}
    )
    updated_config_setting = client.set_configuration_setting(new_config_setting)

    fetched_config_setting = client.get_configuration_setting(
        key="MyKey", label="MyLabel"
    )

    #delete configuration setting
    client.delete_configuration_setting(key="MyKey", label="MyLabel")

    fetched_config_setting = client.get_configuration_setting(
        key="MyKey", label="MyLabel"
    )    #Not found error

if __name__ == "__main__":
    main()