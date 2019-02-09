#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

# Color constants
readonly GRN='\033[0;32m'
readonly NC='\033[0m'

if [[ "$1" ]]
then
  # Update project files from github
  function wpi_update {
    # Clone the repo
    curl -LOks https://github.com/wp-pro-club/init/archive/master.zip
    # Unzip the repo
    unzip -q master.zip
    # Delete old files
    rm -f lib/*
    # Copy new files
    cp -R init-master/lib/ . && cp init-master/* .
    # Set script executable
    chmod +x "$0"
    # Delete repo directory and archive
    rm -rf init-master && rm master.zip

    echo -e "${GRN}All files was succesfully updated!${NC}"
  }

  case "$1" in
  "--update") wpi_update "${@:2}";;
  esac
else
  source ${PWD}/lib/app-init.sh

  # Run the before_install after setup checking
  if [ "$conf_app_setup_shell" == "true" ]; then
      bash ${PWD}/lib/before-install.sh
  fi

  # Run the workflow install after setup checking
  if [ "$conf_app_setup_workflow" != "false" ]; then
      bash ${PWD}/lib/workflow.sh

      # Run the env making after setup checking
      if [ "$conf_app_setup_env" == "true" ]; then
          bash ${PWD}/lib/env.sh
      fi

      # Run the settings script after setup checking
      if [ "$conf_app_setup_settings" == "true" ]; then
          bash ${PWD}/lib/settings.sh
      fi

      # Run the plugins install after setup checking
      if [ "$conf_app_setup_plugins" == "true" ]; then
          bash ${PWD}/lib/plugins-bulk.sh
          bash ${PWD}/lib/plugins-single.sh
      fi

      # Run the theme install after setup checking
      if [ "$conf_app_setup_theme" == "true" ]; then
          bash ${PWD}/lib/theme.sh
      fi

      # Run the extra script after setup checking
      if [ "$conf_app_setup_extra" == "true" ]; then
          bash ${PWD}/lib/extra.sh
      fi
  fi

  # Run the after_install after setup checking
  if [ "$conf_app_setup_shell" == "true" ]; then
      bash ${PWD}/lib/after-install.sh
  fi
fi
