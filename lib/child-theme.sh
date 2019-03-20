#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

# Download default child theme template or custom from config
if [ "$conf_app_config_templates_child_theme" == "default" ]; then
    curl --silent https://raw.githubusercontent.com/wp-pro-club/template-child-theme/master/child-theme-init.sh > tmp-template.sh
else
    curl --silent $conf_app_config_templates_child_theme > tmp-template.sh
fi

# If template downloaded, run the script
if [ -f "${PWD}/tmp-template.sh" ]; then
    bash ${PWD}/tmp-template.sh
    # delete the script after complete
    rm ${PWD}/tmp-template.sh
fi
