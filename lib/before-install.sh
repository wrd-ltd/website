#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

# Download shell scripts from config before project init
for script in "${conf_app_shell_before_install[@]}"
do
    curl --silent $script > tmp-template1.sh
    # If template downloaded, run the script
    if [ -f "${PWD}/tmp-template.sh" ]; then
        bash ${PWD}/tmp-template.sh
        # delete the script after complete
        rm ${PWD}/tmp-template.sh
    fi
done
