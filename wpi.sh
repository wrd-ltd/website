#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

# Run the env making after setup checking
if [ "$conf_app_setup_env" == "true" ]; then
    bash ${PWD}/lib/env.sh
fi

