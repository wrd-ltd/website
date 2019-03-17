#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

# Update project files from github
function wpi_update {
    # Clone the repo
    curl -LOks https://github.com/wp-pro-club/init/archive/master.zip
    # Unzip the repo
    unzip -q master.zip
    # Delete old files
    rm -f lib/*
    # Copy new files
    cp -R init-master/lib/ . && cp -R init-master/* .
    # Set script executable
    chmod +x "$0"
    # Delete repo directory and archive
    rm -rf init-master && rm master.zip
    echo -e "${GRN}All files was succesfully updated!${NC}"
}

case "$1" in
"--self-update") wpi_update "${@:2}";;
esac