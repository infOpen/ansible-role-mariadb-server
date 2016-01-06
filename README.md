# mariadb-server

[![Build Status](https://travis-ci.org/infOpen/ansible-role-mariadb-server.svg?branch=master)](https://travis-ci.org/infOpen/ansible-role-mariadb-server)

Install mariadb-server package.

## Requirements

This role requires Ansible 1.9 or higher,
and platform requirements are listed in the metadata file.

## Testing

This role contains two tests methods :
- locally using Vagrant
- automatically with Travis

### Testing dependencies
- install [Vagrant](https://www.vagrantup.com)
- install [Vagrant serverspec plugin](https://github.com/jvoorhis/vagrant-serverspec)
    $ vagrant plugin install vagrant-serverspec
- install ruby dependencies
    $ bundle install

### Running tests

#### Run playbook and test

- if Vagrant box not running
    $ vagrant up

- if Vagrant box running
    $ vagrant provision

## Role Variables

### Default role variables

    #==============================================================================
    # OS PREFIXES
    #==============================================================================
    mariadbserver_os_prefixes: {}
    
    #==============================================================================
    # ROLE SETTINGS
    #==============================================================================
    # Package variables
    #------------------
    mariadbserver_package_state: present
    mariadbserver_version: '5.5'
    
    # Service variables
    #------------------
    mariadbserver_service_state: started
    mariadbserver_service_enabled: True
    
    mariadbserver_managed_by_phpmyadmin: False
    
    mariadbserver_owner: mysql
    mariadbserver_group: mysql
    
    
    #==============================================================================
    # Credentials
    #==============================================================================
    
    mariadbserver_root_db_password: ""
    mariadbserver_root_db_old_password: ""
    
    mariadbserver_global_accounts: []
    mariadbserver_additionnal_accounts: []
    
    
    #==============================================================================
    # First used for config files
    #==============================================================================
    
    # Client
    mariadbserver_client_port: 3306
    mariadbserver_client_socket: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.sock' }}"
    
    
    # mysqld_safe
    mariadbserver_mysqld_safe_socket: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.sock' }}"
    mariadbserver_mysqld_safe_nice: 0
    
    
    # mysqld
    mariadbserver_mysqld_user: mysql
    mariadbserver_mysqld_pid_file: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.pid' }}"
    mariadbserver_mysqld_socket: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.sock' }}"
    mariadbserver_mysqld_port: 3306
    mariadbserver_mysqld_basedir: /usr
    mariadbserver_mysqld_datadir: "{{ mariadbserver_os_prefixes.data ~ '/mysql' }}"
    mariadbserver_mysqld_tmpdir: /tmp
    mariadbserver_mysqld_lc_messages_dir: "
      {{ mariadbserver_os_prefixes.shared ~ '/mysql' }}"
    
    mariadbserver_mysqld_skip_external_locking: True
    
    mariadbserver_mysqld_bind_address: 127.0.0.1
    
    mariadbserver_mysqld_key_buffer: 16M
    mariadbserver_mysqld_max_allowed_packet: 16M
    mariadbserver_mysqld_thread_stack: 192K
    mariadbserver_mysqld_thread_cache_size: 8
    
    mariadbserver_mysqld_myisam_recover_options: BACKUP
    mariadbserver_mysqld_max_connections: 100
    mariadbserver_mysqld_table_cache: 64
    mariadbserver_mysqld_thread_concurrency: 10
    
    mariadbserver_mysqld_query_cache_limit: 1M
    mariadbserver_mysqld_query_cache_size: 16M
    
    mariadbserver_mysqld_general_log_file: "
      {{ mariadbserver_os_prefixes.log ~ '/mysql/mysql.log' }}"
    mariadbserver_mysqld_general_log: 1
    mariadbserver_mysqld_log_error: "
      {{ mariadbserver_os_prefixes.log ~ '/mysql/error.log' }}"
    mariadbserver_mysqld_slow_query_log_file: "
      {{ mariadbserver_os_prefixes.log ~ '/mysql/mysql-slow.log' }}"
    mariadbserver_mysqld_slow_query_log: 1
    mariadbserver_mysqld_long_query_time: 2
    mariadbserver_mysqld_log_queries_not_using_indexes: True
    
    mariadbserver_mysqld_server_id: 1
    mariadbserver_mysqld_log_bin: "
      {{ mariadbserver_os_prefixes.log ~ '/mysql/mysql-bin.log' }}"
    mariadbserver_mysqld_expire_logs_days: 10
    mariadbserver_mysqld_max_binlog_size: 100M
    mariadbserver_mysqld_binlog_do_db: include_database_name
    mariadbserver_mysqld_binlog_ignore_db: include_database_name
    mariadbserver_mysqld_binlog_format: mixed
    
    # mysqldump
    mariadbserver_mysqldump_quick: True
    mariadbserver_mysqldump_quote_names: True
    mariadbserver_mysqldump_max_allowed_packet: 16M
    
    # mysql
    mariadbserver_mysql_no_auto_rehash: False
    
    # isamchk
    mariadbserver_isamchk_key_buffer: 16M

### OS Specific vars

#### Ubuntu

    #==============================================================================
    # OS PREFIXES
    #==============================================================================
    mariadbserver_os_prefixes:
      data: /var/lib
      log: /var/log
      run: /var/run
      shared: /usr/share
      tmp: /tmp
    
    #==============================================================================
    # ROLE SETTINGS
    #==============================================================================
    mariadbserver_repository_key_id: 1BB943DB
    mariadbserver_repository_key_server: keyserver.ubuntu.com
    mariadbserver_repository_entry: "deb http://ftp.igh.cnrs.fr/pub/mariadb/repo/{{mariadbserver_version}}/ubuntu {{ansible_distribution_release}} main"
    
    mariadbserver_repository_directory: /etc/apt/sources.list.d
    mariadbserver_repository_file_name: mariadb.list
    mariadbserver_repository_file_mode: "0644"
    mariadbserver_repository_file_owner: root
    mariadbserver_repository_file_group: root
    
    mariadbserver_packages:
      - software-properties-common
      - mariadb-server
      - mariadb-client
      - python-mysqldb
    
    mariadbserver_service_name: mysql
    
    mariadbserver_config_file_location: "/etc/mysql/my.cnf":

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: achaussier.mariadb-server }

## License

MIT

## Author Information

Alexandre Chaussier (for Infopen company)
- http://www.infopen.pro
- a.chaussier [at] infopen.pro

