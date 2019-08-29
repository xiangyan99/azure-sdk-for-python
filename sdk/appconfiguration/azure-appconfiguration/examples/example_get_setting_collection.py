# -------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for
# license information.
# --------------------------------------------------------------------------

from azure.appconfiguration import ConfigurationSetting, AzureAppConfigurationClient

def main():
    connection_string = "YOUR CONNECTION STRING"
    client = AzureAppConfigurationClient.from_connection_string(connection_string)
    config_setting_1 = ConfigurationSetting(
        key="MyKey1",
        label="MyLabel",
        value="my value",
        content_type="my content type",
        tags={"my tag": "my tag value"},
    )
    added_config_setting = client.set_configuration_setting(config_setting_1)

    config_setting_2 = ConfigurationSetting(
        key="MyKey2",
        label="MyLabel",
        value="my updated value",
        content_type="my content type",
        tags={"my updated tag": "my updated tag value"}
    )
    updated_config_setting = client.set_configuration_setting(config_setting_2)

    #get setting collection
    all_listed = client.list_configuration_settings()
    for item in all_listed:
        pass  # do something

    filtered_listed = client.list_configuration_settings(
        labels=["*Labe*"], keys=["*Ke*"]
    )
    for item in filtered_listed:
        pass  # do something

if __name__ == "__main__":
    main()