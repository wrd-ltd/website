#!/bin/bash

# Init - Wp Pro Club
# by DimaMinka (https://dimaminka.com)
# https://github.com/wp-pro-club/init

source ${PWD}/lib/app-init.sh

if [[ "$1" ]]
then
    # Run the update script
    bash ${PWD}/lib/update.sh $1
else
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
      if [ "$conf_app_setup_mu_plugins" == "true" ]; then
          bash ${PWD}/lib/mu-plugins.sh
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

      # Run the child theme install after setup checking
      if [ "$conf_app_setup_child_theme" == "true" ]; then
          bash ${PWD}/lib/child-theme.sh
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
