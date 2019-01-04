# [init](https://init.wp-pro.club/)
WordPress init like a PRO

## Copy and update config variables in the `custom-config.yml`:

* setup
  * `workflow` - Set project workflow: bedrock; cdkrock; skeleton; wp-cli;
  * `wordpress` - Set custom WordPress version to install
  * `env` - Enable .env file init
  * `shell` - Enable before_install/after_install shell scripts running
  * `plugins` - Enable plugins install
  * `theme` - Enable theme install
  * `settings` - Enable WordPress setup
  * `extra` - Enable extra scripts running for license etc

* env
  * `db_name` - Database name
  * `db_user` - Database user
  * `db_pass` - Database password
  * `app_host` - Database host
  * `db_prefix` - Database prefix

* shell
  * `before_install` - Install custom scripts via url
  * `after_install` - Install custom scripts via url

* plugins_single
  * `name` - Plugin name in: WordPress repository; wpackagist repository; git repository;
  * `package` - Install plugin via: wp-cli; wpackagist; wp-pro-club;
  * `ver` - Set plugin version
  * `zip` - Set URL for plugin zip dist