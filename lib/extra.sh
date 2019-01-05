#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

# Download default extra template or custom from config
if [ "$conf_app_config_templates_extra" == "default" ]; then
    curl --silent https://raw.githubusercontent.com/wp-pro-club/template-extra/master/extra-init.sh > tmp-template.sh
else
    curl --silent $conf_app_config_templates_extra > tmp-template.sh
fi

# If template downloaded, run the script
if [ -f "${PWD}/tmp-template.sh" ]; then
    bash ${PWD}/tmp-template.sh
    # delete the script after complete
    rm ${PWD}/tmp-template.sh
fi
