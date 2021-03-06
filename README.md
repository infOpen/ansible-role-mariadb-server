# mariadb-server

[![Build Status](https://travis-ci.org/infOpen/ansible-role-mariadb-server.svg?branch=master)](https://travis-ci.org/infOpen/ansible-role-mariadb-server)

Install mariadb-server package.

## Requirements

This role requires Ansible 2.0 or higher,
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
    mariadbserver_architecture: amd64
    mariadbserver_package_state: present
    mariadbserver_version: '5.5'
    
    # Service variables
    #------------------
    mariadbserver_service_state: started
    mariadbserver_service_enabled: True
    
    mariadbserver_managed_by_phpmyadmin: False
    
    mariadbserver_owner: mysql
    mariadbserver_group: mysql
    
    # File permission
    #----------------
    mariadbserver_config_file_owner: root
    mariadbserver_config_file_group: root
    mariadbserver_config_file_mode: "0644"
    
    mariadbserver_logrotate_file_name: /etc/logrotate.d/mariadb-server
    mariadbserver_logrotate_file_owner: root
    mariadbserver_logrotate_file_group: root
    mariadbserver_logrotate_file_mode: "0600"

    mariadbserver_log_dir_owner: "{{ mariadbserver_owner }}"
    mariadbserver_log_dir_group: "{{ mariadbserver_group }}"
    mariadbserver_log_dir_mode: "0750"
    
    mariadbserver_binary_log_dir_owner: "{{ mariadbserver_owner }}"
    mariadbserver_binary_log_dir_group: "{{ mariadbserver_group }}"
    mariadbserver_binary_log_dir_mode: "0750"
    
    
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
    #-------
    mariadbserver_client_port: 3306
    mariadbserver_client_socket: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.sock' }}"
    
    
    # mysqld_safe
    #------------
    mariadbserver_mysqld_safe_socket: "
      {{ mariadbserver_os_prefixes.run ~ '/mysqld/mysqld.sock' }}"
    mariadbserver_mysqld_safe_nice: 0
    
    
    # mysqld
    #-------
    mariadbserver_mysqld_user: 'mysql'
    
    # Compatibility options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#compatibility-options
    mariadbserver_ansi: False
    mariadbserver_old_style_user_limits: 'FALSE'
    mariadbserver_safe_mode: 'FALSE'
    mariadbserver_old: 'OFF'
    mariadbserver_old_alter_table: 'FALSE'
    mariadbserver_old_mode: ''
    mariadbserver_old_passwords: 'FALSE'
    
    # Replication and binary logging options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#replication-and-binary-logging-options
    mariadbserver_abord_slave_event_count: 0
    mariadbserver_auto_increment_increment: 1
    mariadbserver_auto_increment_offset: 1
    mariadbserver_binlog_do_db: []
    mariadbserver_binlog_ignore_db: []
    mariadbserver_binlog_annotate_row_events: 'OFF'
    mariadbserver_binlog_cache_size: 32768
    mariadbserver_binlog_checksum: 'NONE'
    mariadbserver_binlog_commit_wait_count: 0
    mariadbserver_binlog_commit_wait_usec: 100000
    mariadbserver_binlog_direct_non_transactional_updates: 'FALSE'
    mariadbserver_binlog_format: 'MIXED'
    mariadbserver_binlog_optimize_thread_scheduling: 'TRUE'
    mariadbserver_binlog_row_event_max_size: 1024
    mariadbserver_binlog_row_image: 'FULL'
    mariadbserver_binlog_stmt_cache_size: 32768
    mariadbserver_default_master_connection: ''
    mariadbserver_disconnect_slave_event_count: 0
    mariadbserver_gtid_ignore_duplicates: 'OFF'
    mariadbserver_init_rpl_role: 'MASTER'
    mariadbserver_init_slave: []
    mariadbserver_log_basename: 'foobar'
    mariadbserver_log_bin: "
      {{ mariadbserver_os_prefixes.log ~ '/mysql/mysql-bin' }}"
    mariadbserver_log_bin_index: False
    mariadbserver_log_bin_trust_function_creators: 'OFF'
    mariadbserver_log_slave_updates: 'FALSE'
    mariadbserver_master_info_file: 'master.info'
    mariadbserver_master_retry_count: 86400
    mariadbserver_master_ssl: False
    mariadbserver_master_ssl_ca: ''
    mariadbserver_master_ssl_ca_path: ''
    mariadbserver_master_ssl_cert: ''
    mariadbserver_master_ssl_cipher: ''
    mariadbserver_master_ssl_key: ''
    mariadbserver_master_ssl_user: 'test'
    mariadbserver_master_verify_checksum: 'FALSE'
    mariadbserver_max_binlog_cache_size: 32768
    mariadbserver_max_binlog_dump_events: 0
    mariadbserver_max_binlog_size: 104857600
    mariadbserver_max_binlog_stmt_cache_size: 32768
    mariadbserver_max_relay_log_size: 104857600
    mariadbserver_relay_log: ''
    mariadbserver_relay_log_index: ''
    mariadbserver_relay_log_info_file: 'relay-log.info'
    mariadbserver_relay_log_purge: 'TRUE'
    mariadbserver_relay_log_recovery: 'OFF'
    mariadbserver_relay_log_space_limit: 0
    mariadbserver_replicate_annotate_row_events: 'FALSE'
    mariadbserver_replicate_do_db: []
    mariadbserver_replicate_do_table: []
    mariadbserver_replicate_events_marked_for_skip: 'replicate'
    mariadbserver_replicate_ignore_db: []
    mariadbserver_replicate_ignore_table: []
    mariadbserver_replicate_rewrite_db: []
    mariadbserver_replicate_same_server_id: 'FALSE'
    mariadbserver_replicate_wild_do_table: []
    mariadbserver_replicate_wild_ignore_table: []
    mariadbserver_report_host: ''
    mariadbserver_report_password: ''
    mariadbserver_report_port: 0
    mariadbserver_report_user: ''
    mariadbserver_rpl_recovery_rank: 0
    mariadbserver_server_id: 1
    mariadbserver_slave_compressed_protocol: 'FALSE'
    mariadbserver_slave_ddl_exec_mode: 'IDEMPOTENT'
    mariadbserver_slave_domain_parallel_threads: 0
    mariadbserver_slave_exec_mode: 'STRICT'
    mariadbserver_slave_load_tmpdir: '/tmp'
    mariadbserver_slave_max_allowed_packet: 1073741824
    mariadbserver_slave_net_timeout: 3600
    mariadbserver_slave_parallel_max_queued: 131072
    mariadbserver_slave_parallel_threads: 0
    mariadbserver_slave_run_triggers_for_rbr: 'NO'
    mariadbserver_sporadic_binlog_dump_fail: 'FALSE'
    mariadbserver_sysdate_is_now: 'FALSE'
    
    # Disabled in template due to startup error
    mariadbserver_master_host: ''
    mariadbserver_master_password: ''
    mariadbserver_master_port: 3306
    
    
    # Optimizer options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#optimizer-options
    mariadbserver_big_tables: 'FALSE'
    mariadbserver_bulk_insert_buffer_size: 8388608
    mariadbserver_expensive_subquery_limit: 100
    mariadbserver_join_buffer_size: 131072
    mariadbserver_join_buffer_space_limit: 2097152
    mariadbserver_join_cache_level: 2
    mariadbserver_max_heap_table_size: 16777216
    mariadbserver_max_join_size: 4294967295
    mariadbserver_max_seeks_for_key: 4294967295
    mariadbserver_max_sort_length: 1024
    mariadbserver_mrr_buffer_size: 262144
    mariadbserver_optimizer_prune_level: 1
    mariadbserver_optimizer_search_depth: 62
    mariadbserver_optimizer_selectivity_sampling_limit: 100
    mariadbserver_optimizer_switch:
      - 'index_merge=on'
      - 'index_merge_union=on'
      - 'index_merge_sort_union=on'
      - 'index_merge_intersection=on'
      - 'index_merge_sort_intersection=off'
      - 'engine_condition_pushdown=off'
      - 'index_condition_pushdown=on'
      - 'derived_merge=on'
      - 'derived_with_keys=on'
      - 'firstmatch=on'
      - 'loosescan=on'
      - 'materialization=on'
      - 'in_to_exists=on'
      - 'semijoin=on'
      - 'partial_match_rowid_merge=on'
      - 'partial_match_table_scan=on'
      - 'subquery_cache=on'
      - 'mrr=off'
      - 'mrr_cost_based=off'
      - 'mrr_sort_keys=off'
      - 'outer_join_with_cache=on'
      - 'semijoin_with_cache=on'
      - 'join_cache_incremental=on'
      - 'join_cache_hashed=on'
      - 'join_cache_bka=on'
      - 'optimize_join_buffer_size=off'
      - 'table_elimination=on'
      - 'extended_keys=on'
    #  - 'exists_to_in=on'
    mariadbserver_optimizer_use_condition_selectivity: 1
    mariadbserver_query_alloc_block_size: 8192
    mariadbserver_query_prealloc_size: 8192
    mariadbserver_range_alloc_block_size: 4096
    mariadbserver_read_buffer_size: 131072
    mariadbserver_rowid_merge_buff_size: 8388608
    mariadbserver_table_open_cache: 400
    mariadbserver_table_definition_cache: 400
    mariadbserver_tmp_table_size: 16777216
    mariadbserver_use_stat_tables: 'NEVER'
    
    
    # MyISAM options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#myisam-options
    mariadbserver_concurrent_insert: 'AUTO'
    mariadbserver_delayed_insert_limit: 100
    mariadbserver_delayed_insert_timeout: 300
    mariadbserver_delayed_queue_size: 1000
    mariadbserver_external_locking: 'FALSE'
    mariadbserver_ft_stopword_file: False
    mariadbserver_keep_files_on_create: 'OFF'
    mariadbserver_key_buffer_size: 16777216
    mariadbserver_key_cache_age_threshold: 300
    mariadbserver_key_cache_block_size: 1024
    mariadbserver_key_cache_division_limit: 100
    mariadbserver_key_cache_file_hash_size: 512
    mariadbserver_key_cache_segments: 0
    mariadbserver_log_isam: 'myisam.log'
    mariadbserver_myisam_block_size: 1024
    mariadbserver_myisam_data_pointer_size: 6
    mariadbserver_myisam_max_sort_file_size: 9223372036853727232
    mariadbserver_myisam_mmap_size: 4294967295
    mariadbserver_myisam_recover_options: 'BACKUP'
    mariadbserver_myisam_repair_threads: 1
    mariadbserver_myisam_sort_buffer_size: 134216704
    mariadbserver_myisam_stats_method: 'nulls_unequal'
    mariadbserver_myisam_use_mmap: 'OFF'
    
    
    # InnoDB options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#innodb-options
    mariadbserver_ignore_builtin_innodb: 'OFF'
    mariadbserver_innodb: 'ON'
    mariadbserver_innodb_adaptive_flushing: 'TRUE'
    mariadbserver_innodb_adaptive_flushing_lwm: 10
    mariadbserver_innodb_adaptive_flushing_method: 'estimate'
    mariadbserver_innodb_adaptive_hash_index: 'ON'
    mariadbserver_innodb_adaptive_hash_index_partitions: 1
    mariadbserver_innodb_adaptive_max_sleep_delay: 150000
    mariadbserver_innodb_additional_mem_pool_size: 8388608
    mariadbserver_innodb_api_bk_commit_interval: 5
    mariadbserver_innodb_api_disable_rowlock: 'OFF'
    mariadbserver_innodb_api_enable_binlog: 'FALSE'
    mariadbserver_innodb_api_enable_mdl: 'FALSE'
    mariadbserver_innodb_api_trx_level: 0
    mariadbserver_innodb_autoextend_increment: 64
    mariadbserver_innodb_autoinc_lock_mode: 1
    mariadbserver_innodb_background_scrub_data_check_interval: 3600
    mariadbserver_innodb_background_scrub_data_compressed: 0
    mariadbserver_innodb_background_scrub_data_interval: 604800
    mariadbserver_innodb_background_scrub_data_uncompressed: 0
    mariadbserver_innodb_blocking_buffer_pool_restore: 'OFF'
    mariadbserver_innodb_buf_dump_status_frequency: 0
    mariadbserver_innodb_buffer_pool_blob: 'ON'
    mariadbserver_innodb_buffer_pool_dump_at_shutdown: 'OFF'
    mariadbserver_innodb_buffer_pool_dump_now: 'OFF'
    mariadbserver_innodb_buffer_pool_filename: 'ib_buffer_pool'
    mariadbserver_innodb_buffer_pool_index: 'ON'
    mariadbserver_innodb_buffer_pool_instances: 1
    mariadbserver_innodb_buffer_pool_load_abort: 'OFF'
    mariadbserver_innodb_buffer_pool_load_at_startup: 'OFF'
    mariadbserver_innodb_buffer_pool_load_now: 'OFF'
    mariadbserver_innodb_buffer_pool_page: 'ON'
    mariadbserver_innodb_buffer_pool_populate: 'OFF'
    mariadbserver_innodb_buffer_pool_restore_at_startup: 0
    mariadbserver_innodb_buffer_pool_shm_checksum: 'TRUE'
    mariadbserver_innodb_buffer_pool_shm_key: 0
    mariadbserver_innodb_buffer_pool_size: 134217728
    mariadbserver_innodb_change_buffer_max_size: 25
    mariadbserver_innodb_change_buffering: 'all'
    mariadbserver_innodb_checkpoint_age_target: 0
    mariadbserver_innodb_checksums: 'TRUE'
    mariadbserver_innodb_checksum_algorithm: 'innodb'
    mariadbserver_innodb_cleaner_lsn_age_factor: 'high_checkpoint'
    mariadbserver_innodb_cmp: 'ON'
    mariadbserver_innodb_cmp_reset: 'ON'
    mariadbserver_innodb_cmp_per_index_enabled: 'OFF'
    mariadbserver_innodb_cmpmem: 'ON'
    mariadbserver_innodb_cmpmem_reset: 'ON'
    mariadbserver_innodb_commit_concurrency: 0
    mariadbserver_innodb_compression_algorithm: 'none'
    mariadbserver_innodb_compression_failure_threshold_pct: 5
    mariadbserver_innodb_compression_level: 6
    mariadbserver_innodb_compression_pad_pct_max: 50
    mariadbserver_innodb_concurrency_tickets: 5000
    mariadbserver_innodb_corrupt_table_action: 'assert'
    mariadbserver_innodb_data_file_path: 'ibdata1:12M:autoextend'
    mariadbserver_innodb_data_home_dir: "{{ mariadbserver_datadir }}"
    mariadbserver_innodb_default_page_encryption_key: 1
    mariadbserver_innodb_default_page_encryption_key_id: 1
    mariadbserver_innodb_defragment: 'OFF'
    mariadbserver_innodb_defragment_fill_factor: '0.9'
    mariadbserver_innodb_defragment_fill_factor_n_recs: 20
    mariadbserver_innodb_defragment_frequency: 40
    mariadbserver_innodb_defragment_n_pages: 7
    mariadbserver_innodb_defragment_stats_accuracy: 0
    mariadbserver_innodb_dict_size_limit: 0
    mariadbserver_innodb_disable_sort_file_cache: 'OFF'
    mariadbserver_innodb_doublewrite: 'ON'
    mariadbserver_innodb_doublewrite_file: False
    mariadbserver_innodb_empty_free_list_algorithm: 'backoff'
    mariadbserver_innodb_encrypt_log: 'OFF'
    mariadbserver_innodb_encrypt_tables: 'OFF'
    mariadbserver_innodb_encryption_rotate_key_age: 1
    mariadbserver_innodb_encryption_rotation_iops: 100
    mariadbserver_innodb_encryption_threads: 0
    mariadbserver_innodb_expand_import: 0
    mariadbserver_innodb_extra_undoslots: 'OFF'
    mariadbserver_innodb_fake_changes: 'OFF'
    mariadbserver_innodb_fast_checksum: 'FALSE'
    mariadbserver_innodb_fast_recovery: 'OFF'
    mariadbserver_innodb_fast_shutdown: 1
    mariadbserver_innodb_fatal_semaphore_wait_threshold: 600
    mariadbserver_innodb_file_format: 'Antelope'
    mariadbserver_innodb_file_format_check: 'ON'
    mariadbserver_innodb_file_format_max: 'Antelope'
    mariadbserver_innodb_file_io_threads: 4
    mariadbserver_innodb_file_per_table: 'ON'
    mariadbserver_innodb_flush_log_at_timeout: 1
    mariadbserver_innodb_flush_log_at_trx_commit: 1
    mariadbserver_innodb_flush_log_at_trx_commit_session: 3
    mariadbserver_innodb_flush_method: False
    mariadbserver_innodb_flush_neighbor_pages: 1
    mariadbserver_innodb_flush_neighbors: 1
    mariadbserver_innodb_flushing_avg_loops: 30
    mariadbserver_innodb_force_load_corrupted: 'OFF'
    mariadbserver_innodb_force_primary_key: 'OFF'
    mariadbserver_innodb_force_recovery: 0
    mariadbserver_innodb_foreground_preflush: 'exponential_backoff'
    mariadbserver_innodb_ft_aux_table: False
    mariadbserver_innodb_ft_cache_size: 8000000
    mariadbserver_innodb_ft_enable_diag_print: 'OFF'
    mariadbserver_innodb_ft_enable_stopword: 'ON'
    mariadbserver_innodb_ft_max_token_size: 84
    mariadbserver_innodb_ft_min_token_size: 3
    mariadbserver_innodb_ft_num_word_optimize: 2000
    mariadbserver_innodb_ft_result_cache_limit: 2000000000
    mariadbserver_innodb_ft_server_stopword_table: ''
    mariadbserver_innodb_ft_sort_pll_degree: 2
    mariadbserver_innodb_ft_total_cache_size: 640000000
    mariadbserver_innodb_ft_user_stopword_table: ''
    mariadbserver_innodb_ibuf_accel_rate: 100
    mariadbserver_innodb_ibuf_active_contract: 1
    mariadbserver_innodb_ibuf_max_size: "{{ (mariadbserver_innodb_buffer_pool_size / 2) | int }}"
    mariadbserver_innodb_idle_flush_pct: 100
    mariadbserver_innodb_immediate_scrub_data_uncompressed: 'OFF'
    mariadbserver_innodb_import_table_from_xtrabackup: 0
    mariadbserver_innodb_index_stats: 'ON'
    mariadbserver_innodb_instrument_semaphore: 'OFF'
    mariadbserver_innodb_io_capacity: 200
    mariadbserver_innodb_io_capacity_max: 200
    mariadbserver_innodb_kill_idle_transaction: 0
    mariadbserver_innodb_large_prefix: 'OFF'
    mariadbserver_innodb_lazy_drop_table: 0
    mariadbserver_innodb_lock_wait_timeout: 50
    mariadbserver_innodb_lock_waits: 'ON'
    mariadbserver_innodb_locking_fake_changes: 'TRUE'
    mariadbserver_innodb_locks: 'ON'
    mariadbserver_innodb_locks_unsafe_for_binlog: 'FALSE'
    mariadbserver_innodb_log_arch_dir: './'
    mariadbserver_innodb_log_arch_expire_sec: 0
    mariadbserver_innodb_log_archive: 'OFF'
    mariadbserver_innodb_log_block_size: 512
    mariadbserver_innodb_log_buffer_size: 8388608
    mariadbserver_innodb_log_checksum_algorithm: 'innodb'
    mariadbserver_innodb_log_compressed_pages: 'TRUE'
    mariadbserver_innodb_log_file_size: 5242880
    mariadbserver_innodb_log_files_in_group: 2
    mariadbserver_innodb_log_group_home_dir: "{{ mariadbserver_datadir }}"
    mariadbserver_innodb_lru_scan_depth: 1024
    mariadbserver_innodb_max_bitmap_file_size: 104857600
    mariadbserver_innodb_max_changed_pages: 1000000
    mariadbserver_innodb_max_dirty_pages_pct: 75
    mariadbserver_innodb_max_dirty_pages_pct_lwm: '0.001'
    mariadbserver_innodb_max_purge_lag: 0
    mariadbserver_innodb_max_purge_lag_delay: 0
    mariadbserver_innodb_merge_sort_block_size: 1048576
    mariadbserver_innodb_mtflush_threads: 8
    mariadbserver_innodb_monitor_disable: False
    mariadbserver_innodb_monitor_enable: False
    mariadbserver_innodb_monitor_reset: False
    mariadbserver_innodb_monitor_reset_all: False
    mariadbserver_innodb_old_blocks_pct: 37
    mariadbserver_innodb_old_blocks_time: 1000
    mariadbserver_innodb_online_alter_log_max_size: 134217728
    #mariadbserver_innodb_open_files: 'autosized'
    mariadbserver_innodb_open_files: 300
    mariadbserver_innodb_optimize_fulltext_only: 'OFF'
    mariadbserver_innodb_overwrite_relay_log_info: 'FALSE'
    mariadbserver_innodb_page_size: 16384
    mariadbserver_innodb_prefix_index_cluster_optimization: 'OFF'
    mariadbserver_innodb_print_all_deadlocks: 'OFF'
    mariadbserver_innodb_purge_batch_size: 300
    mariadbserver_innodb_purge_threads: 1
    mariadbserver_innodb_random_read_ahead: 'OFF'
    mariadbserver_innodb_read_ahead: 'linear'
    mariadbserver_innodb_read_ahead_threshold: 56
    mariadbserver_innodb_read_io_threads: 4
    mariadbserver_innodb_read_only: 'OFF'
    mariadbserver_innodb_recovery_stats: 'FALSE'
    mariadbserver_innodb_recovery_update_relay_log: 'FALSE'
    mariadbserver_innodb_replication_delay: 0
    mariadbserver_innodb_rollback_on_timeout: 'FALSE'
    mariadbserver_innodb_rollback_segments: 128
    mariadbserver_innodb_rseg: 'FALSE'
    mariadbserver_innodb_scrub_log_interval: 56
    mariadbserver_innodb_scrub_log_speed: 256
    mariadbserver_innodb_sched_priority_cleaner: 19
    mariadbserver_innodb_show_locks_held: 10
    mariadbserver_innodb_show_verbose_locks: 0
    mariadbserver_innodb_sort_buffer_size: 1048576
    mariadbserver_innodb_spin_wait_delay: 6
    mariadbserver_innodb_stats_auto_recalc: 'ON'
    mariadbserver_innodb_stats_method: 'nulls_equal'
    mariadbserver_innodb_stats_modified_counter: 0
    mariadbserver_innodb_stats_on_metadata: 'OFF'
    mariadbserver_innodb_stats_persistent: 'ON'
    mariadbserver_innodb_stats_persistent_sample_pages: 20
    mariadbserver_innodb_stats_sample_pages: 8
    mariadbserver_innodb_stats_traditional: 'ON'
    mariadbserver_innodb_stats_transient_sample_pages: 8
    mariadbserver_innodb_stats_update_need_lock: 1
    mariadbserver_innodb_status_file: 'FALSE'
    mariadbserver_innodb_status_output: 'OFF'
    mariadbserver_innodb_status_output_locks: 'OFF'
    mariadbserver_innodb_strict_mode: 'OFF'
    mariadbserver_innodb_support_xa: 'ON'
    mariadbserver_innodb_sync_array_size: 1
    mariadbserver_innodb_sync_spin_loops: 30
    mariadbserver_innodb_sys_indexes: 'ON'
    mariadbserver_innodb_sys_stats: 'ON'
    mariadbserver_innodb_sys_tables: 'ON'
    mariadbserver_innodb_table_locks: 'ON'
    mariadbserver_innodb_table_stats: 'ON'
    mariadbserver_innodb_thread_concurrency: 0
    mariadbserver_innodb_thread_concurrency_timer_based: 'FALSE'
    mariadbserver_innodb_thread_sleep_delay: 10000
    mariadbserver_innodb_track_changed_pages: 'OFF'
    mariadbserver_innodb_trx: 'ON'
    mariadbserver_innodb_undo_directory: '.'
    mariadbserver_innodb_undo_logs: 128
    mariadbserver_innodb_undo_tablespaces: 0
    mariadbserver_innodb_use_atomic_writes: 'OFF'
    mariadbserver_innodb_use_fallocate: 'OFF'
    mariadbserver_innodb_use_global_flush_log_at_trx_commit: 'ON'
    mariadbserver_innodb_use_mtflush: 'OFF'
    mariadbserver_innodb_use_native_aio: 'ON'
    mariadbserver_innodb_use_stacktrace: 'OFF'
    mariadbserver_innodb_use_sys_malloc: 'ON'
    mariadbserver_innodb_use_sys_stats_table: 'FALSE'
    mariadbserver_innodb_use_trim: 'OFF'
    mariadbserver_innodb_write_io_threads: 4
    
    
    # Aria options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#aria-options
    mariadbserver_aria_block_size: 8192
    mariadbserver_aria_checkpoint_interval: 30
    mariadbserver_aria_checkpoint_log_activity: 1048576
    mariadbserver_aria_encrypt_tables: 'OFF'
    mariadbserver_aria_force_start_after_recovery_failures: 0
    mariadbserver_aria_group_commit: 'none'
    mariadbserver_aria_group_commit_interval: 0
    mariadbserver_aria_log_dir_path: "{{ mariadbserver_datadir }}"
    mariadbserver_aria_log_file_size: 1073741824
    mariadbserver_aria_log_purge_type: 'immediate'
    mariadbserver_aria_max_sort_file_size: 9223372036853727232
    mariadbserver_aria_page_checksum: 'ON'
    mariadbserver_aria_pagecache_age_threshold: 300
    mariadbserver_aria_pagecache_buffer_size: 134217728
    mariadbserver_aria_pagecache_division_limit: 100
    mariadbserver_aria_pagecache_file_hash_size: 512
    mariadbserver_aria_recover: 'NORMAL'
    mariadbserver_aria_repair_threads: 1
    mariadbserver_aria_sort_buffer_size: 268434432
    mariadbserver_aria_stats_method: 'nulls_unequal'
    mariadbserver_aria_sync_log_dir: 'NEWFILE'
    mariadbserver_deadlock_search_depth_long: 15
    mariadbserver_deadlock_search_depth_short: 4
    mariadbserver_deadlock_timeout_long: 50000000
    mariadbserver_deadlock_timeout_short: 10000
    
    
    # Performance schema options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#performance-schema-options
    mariadbserver_performance_schema: 'OFF'
    mariadbserver_performance_schema_accounts_size: '-1'
    mariadbserver_performance_schema_digests_size: '-1'
    mariadbserver_performance_schema_events_stages_history_long_size: '-1'
    mariadbserver_performance_schema_events_stages_history_size: '-1'
    mariadbserver_performance_schema_events_statements_history_long_size: '-1'
    mariadbserver_performance_schema_events_statements_history_size: '-1'
    mariadbserver_performance_schema_events_waits_history_long_size: '-1'
    mariadbserver_performance_schema_events_waits_history_size: '-1'
    mariadbserver_performance_schema_hosts_size: '-1'
    mariadbserver_performance_schema_max_cond_classes: 80
    mariadbserver_performance_schema_max_cond_instances: '-1'
    mariadbserver_performance_schema_max_digest_length: 1024
    mariadbserver_performance_schema_max_file_classes: 50
    mariadbserver_performance_schema_max_file_handles: 32768
    mariadbserver_performance_schema_max_file_instances: '-1'
    mariadbserver_performance_schema_max_mutex_classes: 200
    mariadbserver_performance_schema_max_mutex_instances: '-1'
    mariadbserver_performance_schema_max_rwlock_classes: 40
    mariadbserver_performance_schema_max_rwlock_instances: '-1'
    mariadbserver_performance_schema_max_socket_classes: 10
    mariadbserver_performance_schema_max_socket_instances: '-1'
    mariadbserver_performance_schema_max_stage_classes: 150
    mariadbserver_performance_schema_max_statement_classes: 180
    mariadbserver_performance_schema_max_table_handles: '-1'
    mariadbserver_performance_schema_max_table_instances: '-1'
    mariadbserver_performance_schema_max_thread_classes: 50
    mariadbserver_performance_schema_max_thread_instances: '-1'
    mariadbserver_performance_schema_session_connect_attrs_size: '-1'
    mariadbserver_performance_schema_setup_actors_size: 100
    mariadbserver_performance_schema_setup_objects_size: 100
    mariadbserver_performance_schema_users_size: '-1'
    
    
    # CONNECT options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#connect-options
    mariadbserver_use_connect_engine: False
    mariadbserver_connect_conv_size: 8192
    mariadbserver_connect_exact_info: 'OFF'
    mariadbserver_connect_indx_map: 'OFF'
    mariadbserver_connect_json_grp_size: 10
    mariadbserver_connect_type_conv: 'NO'
    mariadbserver_connect_use_tempfile: 'AUTO'
    mariadbserver_connect_work_size: 67108864
    mariadbserver_connect_xtrace: 0
    
    
    # Other options
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#other-options
    mariadbserver_allow_suspicious_udfs: 'FALSE'
    mariadbserver_automatic_sp_privileges: 'TRUE'
    mariadbserver_back_log: 150
    mariadbserver_basedir: '/usr'
    mariadbserver_bind_address: '127.0.0.1'
    mariadbserver_character_set_client_handshake: 'TRUE'
    mariadbserver_character_set_filesystem: 'binary'
    mariadbserver_character_set_server: 'latin1'
    mariadbserver_character_sets_dir: '/usr/share/mysql/charsets/'
    mariadbserver_chroot: False
    mariadbserver_collation_server: 'latin1_swedish_ci'
    mariadbserver_completion_type: 'NO_CHAIN'
    mariadbserver_connect_timeout: 10
    mariadbserver_datadir: '/var/lib/mysql/'
    mariadbserver_debug: 'd:t:i:o,/tmp/mysqld.trace'
    mariadbserver_debug_no_thread_alarm: 'FALSE'
    mariadbserver_default_regex_flags: []
    mariadbserver_default_storage_engine: 'InnoDB'
    mariadbserver_default_time_zone: 'SYSTEM'
    mariadbserver_default_tmp_storage_engine: ''
    mariadbserver_default_week_format: 0
    mariadbserver_delay_key_write: 'ON'
    mariadbserver_des_key_file: False
    mariadbserver_div_precision_increment: 4
    mariadbserver_encrypt_tmp_disk_tables: 'OFF'
    mariadbserver_encrypt_tmp_files: 'OFF'
    mariadbserver_event_scheduler: 'OFF'
    mariadbserver_exit_info: False
    mariadbserver_explicit_defaults_for_timestamp: 'OFF'
    mariadbserver_extra_max_connections: 1
    mariadbserver_extra_port: 0
    mariadbserver_flush: 'OFF'
    mariadbserver_flush_time: 0
    mariadbserver_ft_boolean_syntax: '+ -><()~*:""&|'
    mariadbserver_ft_max_word_len: 84
    mariadbserver_ft_min_word_len: 4
    mariadbserver_ft_query_expansion_limit: 20
    mariadbserver_general_log: 'TRUE'
    mariadbserver_general_log_file: '/var/log/mysql/mysql.log'
    mariadbserver_getopt_prefix_matching: 'TRUE'
    mariadbserver_group_concat_max_len: 1024
    mariadbserver_histogram_size: 0
    mariadbserver_histogram_type: 'SINGLE_PREC_HB'
    mariadbserver_host_cache_size: 128
    mariadbserver_ignore_db_dirs: []
    mariadbserver_init_connect: []
    mariadbserver_init_file: False
    mariadbserver_interactive_timeout: 28800
    mariadbserver_language: '/usr/local/mysql/share/mysql/english/'
    mariadbserver_large_pages: 'OFF'
    mariadbserver_lc_messages: 'en_US'
    mariadbserver_lc_messages_dir: '/usr/share/mysql'
    mariadbserver_lc_time_names: 'en_US'
    mariadbserver_local_infile: 'ON'
    mariadbserver_lock_wait_timeout: 31536000
    mariadbserver_log_error: '/var/log/mysql/error.log'
    mariadbserver_log_output: 'FILE'
    mariadbserver_log_queries_not_using_indexes: 'OFF'
    mariadbserver_log_short_format: 'OFF'
    mariadbserver_log_slow_admin_statements: 'FALSE'
    mariadbserver_log_slow_filter:
      - admin
      - filesort
      - filesort_on_disk
      - full_join
      - full_scan
      - query_cache
      - query_cache_miss
      - tmp_table
      - tmp_table_on_disk
    mariadbserver_log_slow_rate_limit: 1
    mariadbserver_log_slow_slave_statements: 'FALSE'
    mariadbserver_log_slow_verbosity: 'query_plan'
    mariadbserver_log_tc: 'tc.log'
    mariadbserver_log_tc_size: 24576
    mariadbserver_log_warnings: 1
    mariadbserver_long_query_time: 10
    mariadbserver_low_priority_updates: 'FALSE'
    mariadbserver_lower_case_table_names: 0
    mariadbserver_memlock: 'OFF'
    mariadbserver_max_allowed_packet: 1048576
    mariadbserver_max_connect_errors: 100
    mariadbserver_max_connections: 151
    mariadbserver_max_delayed_threads: 20
    mariadbserver_max_digest_length: 1024
    mariadbserver_max_error_count: 64
    mariadbserver_max_length_for_sort_data: 1024
    mariadbserver_max_prepared_stmt_count: 16382
    mariadbserver_max_sp_recursion_depth: 0
    mariadbserver_max_statement_time: 0
    mariadbserver_max_user_connections: 0
    mariadbserver_max_write_lock_count: 4294967295
    mariadbserver_metadata_locks_cache_size: 1024
    mariadbserver_metadata_locks_hash_instances: 8
    mariadbserver_min_examined_row_limit: 0
    mariadbserver_mysql56_temporal_format: 'ON'
    mariadbserver_net_buffer_length: 16384
    mariadbserver_net_read_timeout: 30
    mariadbserver_net_retry_count: 10
    mariadbserver_net_write_timeout: 60
    mariadbserver_open_files_limit: 1024
    mariadbserver_pid_file: '/var/run/mysqld/mysqld.pid'
    mariadbserver_plugin_dir: '/usr/lib/mysql/plugin/'
    mariadbserver_plugin_load: []
    mariadbserver_plugin_load_add: []
    mariadbserver_plugin_maturity: 'unknown'
    mariadbserver_port: 3306
    mariadbserver_port_open_timeout: 0
    mariadbserver_preload_buffer_size: 32768
    mariadbserver_profiling_history_size: 15
    mariadbserver_progress_report_time: 5
    mariadbserver_query_cache_limit: 1048576
    mariadbserver_query_cache_min_res_unit: 4096
    mariadbserver_query_cache_size: 16777216
    mariadbserver_query_cache_strip_comments: 'OFF'
    mariadbserver_query_cache_type: 'ON'
    mariadbserver_query_cache_wlock_invalidate: 'OFF'
    mariadbserver_read_only: 'OFF'
    mariadbserver_read_rnd_buffer_size: 262144
    mariadbserver_safe_user_create: 'OFF'
    mariadbserver_secure_auth: 'OFF'
    mariadbserver_secure_file_priv: False
    mariadbserver_show_slave_auth_info: 'FALSE'
    mariadbserver_skip_grant_tables: False
    mariadbserver_skip_host_cache: False
    mariadbserver_skip_name_resolve: False
    mariadbserver_skip_networking: False
    mariadbserver_skip_show_database: False
    mariadbserver_skip_slave_start: False
    mariadbserver_skip_ssl: False
    mariadbserver_skip_stack_trace: False
    mariadbserver_skip_symbolic_links: False
    mariadbserver_slow_launch_time: 2
    mariadbserver_slow_query_log: 'TRUE'
    mariadbserver_slow_query_log_file: '/var/log/mysql/mysql-slow.log'
    mariadbserver_socket: '/var/run/mysqld/mysqld.sock'
    mariadbserver_sort_buffer_size: 2097152
    mariadbserver_sql_mode: []
    mariadbserver_ssl: 'FALSE'
    mariadbserver_ssl_ca: False
    mariadbserver_ssl_capath: False
    mariadbserver_ssl_cert: False
    mariadbserver_ssl_cipher: False
    mariadbserver_ssl_crl: False
    mariadbserver_ssl_crlpath: False
    mariadbserver_ssl_key: False
    mariadbserver_stack_trace: 'TRUE'
    mariadbserver_stored_program_cache: 256
    mariadbserver_strict_password_validation: 'ON'
    mariadbserver_symbolic_links: 'TRUE'
    mariadbserver_sync_frm: 'TRUE'
    mariadbserver_tc_heuristic_recover: 'COMMIT'
    mariadbserver_temp_pool: True
    mariadbserver_thread_cache_size: 0
    mariadbserver_thread_concurrency: 10
    mariadbserver_thread_handling: 'one-thread-per-connection'
    mariadbserver_thread_pool_idle_timeout: 60
    mariadbserver_thread_pool_max_threads: 500
    mariadbserver_thread_pool_oversubscribe: 3
    mariadbserver_thread_pool_size: 1
    mariadbserver_thread_pool_stall_limit: 500
    mariadbserver_thread_stack: 294912
    mariadbserver_timed_mutexes: 'FALSE'
    mariadbserver_tmpdir: '/tmp'
    mariadbserver_transaction_alloc_block_size: 8192
    mariadbserver_transaction_prealloc_size: 4096
    mariadbserver_transaction_isolation: 'REPEATABLE-READ'
    mariadbserver_transaction_read_only: 'FALSE'
    mariadbserver_updatable_views_with_limit: 'YES'
    mariadbserver_user: 'mysql'
    mariadbserver_userstat: 'FALSE'
    mariadbserver_verbose: 'TRUE'
    mariadbserver_wait_timeout: 28800
    
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

