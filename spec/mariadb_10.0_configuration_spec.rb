require 'serverspec'

describe 'MariaDB 10.0 config', :if => ENV['MARIADB_VERSION'] == '10.0' do

    # Compatibility options
    #----------------------
    #https://mariadb.com/kb/en/mariadb/mysqld-options/#compatibility-options

    context mysql_config('old-style-user-limits') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('old') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('old-alter-table') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('old-mode') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('old-passwords') do
        its(:value) { should eq 'FALSE' }
    end

    # Replication and binary logging options
    #---------------------------------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#replication-and-binary-logging-options

    # Not used or needed in MariaDB
    #context mysql_config('abort-slave-event-count') do
    #    its(:value) { should eq 0 }
    #end
    context mysql_config('auto-increment-increment') do
        its(:value) { should eq 1 }
    end
    context mysql_config('auto-increment-offset') do
        its(:value) { should eq 1 }
    end
    context mysql_config('binlog-annotate-row-events') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('binlog-cache-size') do
        its(:value) { should eq 32768 }
    end
    context mysql_config('binlog-checksum') do
        its(:value) { should eq 'NONE' }
    end
    context mysql_config('binlog-commit-wait-count') do
        its(:value) { should eq 0 }
    end
    context mysql_config('binlog-commit-wait-usec') do
        its(:value) { should eq 100000 }
    end
    context mysql_config('binlog-direct-non-transactional-updates') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('binlog-format') do
        its(:value) { should eq 'MIXED' }
    end
    context mysql_config('binlog-optimize-thread-scheduling') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('binlog-row-event-max-size') do
        its(:value) { should eq 1024 }
    end
    # Not used or needed in MariaDB today, will be implemented later
    #context mysql_config('binlog-row-image') do
    #    its(:value) { should eq 'FULL' }
    #end
    context mysql_config('binlog-stmt-cache-size') do
        its(:value) { should eq 32768 }
    end
    # Not used or needed in MariaDB
    #context mysql_config('disconnect-slave-event-count') do
    #    its(:value) { should eq 0 }
    #end
    context mysql_config('gtid-ignore-duplicates') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('init-rpl-role') do
        its(:value) { should eq 'MASTER' }
    end
    context mysql_config('init-slave') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('log-basename') do
        its(:value) { should eq 'foobar' }
    end
    context mysql_config('log-bin') do
        its(:value) { should eq '/var/log/mysql/mysql-bin' }
    end
    context mysql_config('log-bin-trust-function-creators') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('log-slave-updates') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('master-info-file') do
        its(:value) { should eq 'master.info' }
    end
    context mysql_config('master-retry-count') do
        its(:value) { should eq 86400 }
    end
    context mysql_config('master-verify-checksum') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('max-binlog-cache-size') do
        its(:value) { should eq 32768 }
    end
    # Not used or needed in MariaDB
    #context mysql_config('max-binlog-dump-events') do
    #    its(:value) { should eq 0 }
    #end
    context mysql_config('max-binlog-size') do
        its(:value) { should eq 104857600 }
    end
    context mysql_config('max-binlog-stmt-cache-size') do
        its(:value) { should eq 32768 }
    end
    context mysql_config('max-relay-log-size') do
        its(:value) { should eq 104857600 }
    end
    context mysql_config('relay-log-index') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('relay-log-info-file') do
        its(:value) { should eq 'relay-log.info' }
    end
    context mysql_config('relay-log-purge') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('relay-log-recovery') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('relay-log-space-limit') do
        its(:value) { should eq 0 }
    end
    context mysql_config('replicate-annotate-row-events') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('replicate-events-marked-for-skip') do
        its(:value) { should eq 'replicate' }
    end
    context mysql_config('replicate-same-server-id') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('report-host') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('report-password') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('report-port') do
        its(:value) { should eq 0 }
    end
    context mysql_config('report-user') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('rpl-recovery-rank') do
        its(:value) { should eq 0 }
    end
    context mysql_config('server-id') do
        its(:value) { should eq 1 }
    end
    context mysql_config('slave-compressed-protocol') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('slave-ddl-exec-mode') do
        its(:value) { should eq 'IDEMPOTENT' }
    end
    context mysql_config('slave-domain-parallel-threads') do
        its(:value) { should eq 0 }
    end
    context mysql_config('slave-exec-mode') do
        its(:value) { should eq 'STRICT' }
    end
    context mysql_config('slave-load-tmpdir') do
        its(:value) { should eq '/tmp' }
    end
    context mysql_config('slave-max-allowed-packet') do
        its(:value) { should eq 1073741824 }
    end
    context mysql_config('slave-net-timeout') do
        its(:value) { should eq 3600 }
    end
    context mysql_config('slave-parallel-max-queued') do
        its(:value) { should eq 131072 }
    end
    context mysql_config('slave-parallel-threads') do
        its(:value) { should eq 0 }
    end
    # Not used or needed in MariaDB
    #context mysql_config('sporadic-binlog-dump-fail') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('sysdate-is-now') do
        its(:value) { should eq 'FALSE' }
    end

    # Disabled due to startup error.
    #context mysql_config('default-master-connection') do
    #    its(:value) { should eq ' ' }
    #end
    #context mysql_config('master-host') do
    #    its(:value) { should eq ' ' }
    #end
    #context mysql_config('master-password') do
    #    its(:value) { should eq ' ' }
    #end
    #context mysql_config('master-port') do
    #    its(:value) { should eq 3306 }
    #end

    # Optimizer options
    #------------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#optimizer-options

    context mysql_config('big-tables') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('bulk-insert-buffer-size') do
        its(:value) { should eq 8388608 }
    end
    context mysql_config('expensive-subquery-limit') do
        its(:value) { should eq 100 }
    end
    context mysql_config('join-buffer-size') do
        its(:value) { should eq 131072 }
    end
    context mysql_config('join-buffer-space-limit') do
        its(:value) { should eq 2097152 }
    end
    context mysql_config('join-cache-level') do
        its(:value) { should eq 2 }
    end
    context mysql_config('max-heap-table-size') do
        its(:value) { should eq 16777216 }
    end
    context mysql_config('max-join-size') do
        its(:value) { should eq 4294967295 }
    end
    context mysql_config('max-seeks-for-key') do
        its(:value) { should eq 4294967295 }
    end
    context mysql_config('max-sort-length') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('mrr-buffer-size') do
        its(:value) { should eq 262144 }
    end
    context mysql_config('optimizer-prune-level') do
        its(:value) { should eq 1 }
    end
    context mysql_config('optimizer-search-depth') do
        its(:value) { should eq 62 }
    end
    context mysql_config('optimizer-selectivity-sampling-limit') do
        its(:value) { should eq 100 }
    end
    context mysql_config('optimizer-use-condition-selectivity') do
        its(:value) { should eq 1 }
    end
    context mysql_config('optimizer-switch') do
        its(:value) { should include 'index_merge=on,index_merge_union=on,index_merge_sort_union=on,index_merge_intersection=on,index_merge_sort_intersection=off,engine_condition_pushdown=off,index_condition_pushdown=on,derived_merge=on,derived_with_keys=on,firstmatch=on,loosescan=on,materialization=on,in_to_exists=on,semijoin=on,partial_match_rowid_merge=on,partial_match_table_scan=on,subquery_cache=on,mrr=off,mrr_cost_based=off,mrr_sort_keys=off,outer_join_with_cache=on,semijoin_with_cache=on,join_cache_incremental=on,join_cache_hashed=on,join_cache_bka=on,optimize_join_buffer_size=off,table_elimination=on,extended_keys=on' }
    end
    context mysql_config('query-alloc-block-size') do
        its(:value) { should eq 8192 }
    end
    context mysql_config('query-prealloc-size') do
        its(:value) { should eq 8192 }
    end
    context mysql_config('range-alloc-block-size') do
        its(:value) { should eq 4096 }
    end
    context mysql_config('read-buffer-size') do
        its(:value) { should eq 131072 }
    end
    context mysql_config('rowid-merge-buff-size') do
        its(:value) { should eq 8388608 }
    end
    context mysql_config('table-definition-cache') do
        its(:value) { should eq 400 }
    end
    context mysql_config('table-open-cache') do
        its(:value) { should eq 400 }
    end
    context mysql_config('tmp-table-size') do
        its(:value) { should eq 16777216 }
    end
    context mysql_config('use-stat-tables') do
        its(:value) { should eq 'NEVER' }
    end

    # MyISAM options
    #---------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#myisam-options

    context mysql_config('concurrent-insert') do
        its(:value) { should eq 'AUTO' }
    end
    context mysql_config('delayed-insert-limit') do
        its(:value) { should eq 100 }
    end
    context mysql_config('delayed-insert-timeout') do
        its(:value) { should eq 300 }
    end
    context mysql_config('delayed-queue-size') do
        its(:value) { should eq 1000 }
    end
    context mysql_config('external-locking') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('keep-files-on-create') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('key-buffer-size') do
        its(:value) { should eq 16777216 }
    end
    context mysql_config('key-cache-age-threshold') do
        its(:value) { should eq 300 }
    end
    context mysql_config('key-cache-block-size') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('key-cache-division-limit') do
        its(:value) { should eq 100 }
    end
    context mysql_config('key-cache-file-hash-size') do
        its(:value) { should eq 512 }
    end
    context mysql_config('key-cache-segments') do
        its(:value) { should eq 0 }
    end
    context mysql_config('log-isam') do
        its(:value) { should eq 'myisam.log' }
    end
    context mysql_config('myisam-block-size') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('myisam-data-pointer-size') do
        its(:value) { should eq 6 }
    end
    context mysql_config('myisam-max-sort-file-size') do
        its(:value) { should eq 9223372036853727232 }
    end
    context mysql_config('myisam-mmap-size') do
        its(:value) { should eq 4294967295 }
    end
    context mysql_config('myisam-recover-options') do
        its(:value) { should eq 'BACKUP' }
    end
    context mysql_config('myisam-repair-threads') do
        its(:value) { should eq 1 }
    end
    context mysql_config('myisam-sort-buffer-size') do
        its(:value) { should eq 134216704 }
    end
    context mysql_config('myisam-stats-method') do
        its(:value) { should eq 'nulls_unequal' }
    end
    context mysql_config('myisam-use-mmap') do
        its(:value) { should eq 'FALSE' }
    end

    # InnoDB options
    #---------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#innodb-options

    context mysql_config('ignore-builtin-innodb') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-adaptive-flushing') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-adaptive-flushing-lwm') do
        its(:value) { should eq 10 }
    end
    context mysql_config('innodb-adaptive-hash-index') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-adaptive-hash-index-partitions') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-additional-mem-pool-size') do
        its(:value) { should eq 8388608 }
    end
    context mysql_config('innodb-adaptive-max-sleep-delay') do
        its(:value) { should eq 150000 }
    end
    context mysql_config('innodb-api-bk-commit-interval') do
        its(:value) { should eq 5 }
    end
    context mysql_config('innodb-api-disable-rowlock') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-api-enable-binlog') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-api-enable-mdl') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-api-trx-level') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-autoextend-increment') do
        its(:value) { should eq 64 }
    end
    context mysql_config('innodb-autoinc-lock-mode') do
        its(:value) { should eq 1 }
    end
    # Startup error
    #context mysql_config('innodb-blocking-buffer-pool-restore') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('innodb-buffer-pool-dump-at-shutdown') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-buffer-pool-dump-now') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-buffer-pool-filename') do
        its(:value) { should eq 'ib_buffer_pool' }
    end
    # Startup error
    #context mysql_config('innodb-buffer-pool-blob') do
    #    its(:value) { should eq 'TRUE' }
    #end
    #context mysql_config('innodb-buffer-pool-index') do
    #    its(:value) { should eq 'TRUE' }
    #end
    context mysql_config('innodb-buffer-pool-instances') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-buffer-pool-load-abort') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-buffer-pool-load-at-startup') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-buffer-pool-load-now') do
        its(:value) { should eq 'FALSE' }
    end
    # Startup error
    #context mysql_config('innodb-buffer-pool-page') do
    #    its(:value) { should eq 'TRUE' }
    #end
    context mysql_config('innodb-buffer-pool-populate') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-buffer-pool-size') do
        its(:value) { should eq 134217728 }
    end
    context mysql_config('innodb-change-buffer-max-size') do
        its(:value) { should eq 25 }
    end
    context mysql_config('innodb-change-buffering') do
        its(:value) { should eq 'all' }
    end
    context mysql_config('innodb-checksum-algorithm') do
        its(:value) { should eq 'innodb' }
    end
    context mysql_config('innodb-cleaner-lsn-age-factor') do
        its(:value) { should eq 'high_checkpoint' }
    end
    context mysql_config('innodb-cmp') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-cmp-reset') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-cmp-per-index-enabled') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-cmpmem') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-cmpmem-reset') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-commit-concurrency') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-compression-failure-threshold-pct') do
        its(:value) { should eq 5 }
    end
    context mysql_config('innodb-compression-level') do
        its(:value) { should eq 6 }
    end
    context mysql_config('innodb-compression-pad-pct-max') do
        its(:value) { should eq 50 }
    end
    context mysql_config('innodb-concurrency-tickets') do
        its(:value) { should eq 5000 }
    end
    context mysql_config('innodb-corrupt-table-action') do
        its(:value) { should eq 'assert' }
    end
    context mysql_config('innodb-data-file-path') do
        its(:value) { should eq 'ibdata1:12M:autoextend' }
    end
    context mysql_config('innodb-data-home-dir') do
        its(:value) { should eq '/var/lib/mysql/' }
    end
    context mysql_config('innodb-disable-sort-file-cache') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-doublewrite') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-empty-free-list-algorithm') do
        its(:value) { should eq 'backoff' }
    end
    # Startup error
    #context mysql_config('innodb-expand-import') do
    #    its(:value) { should eq 0 }
    #end
    #context mysql_config('innodb-extra-undoslots') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('innodb-fake-changes') do
        its(:value) { should eq 'FALSE' }
    end
    # Startup error
    #context mysql_config('innodb-fast-recovery') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('innodb-fast-shutdown') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-file-format') do
        its(:value) { should eq 'Antelope' }
    end
    context mysql_config('innodb-file-format-check') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-file-format-max') do
        its(:value) { should eq 'Antelope' }
    end
    context mysql_config('innodb-file-io-threads') do
        its(:value) { should eq 4 }
    end
    context mysql_config('innodb-file-per-table') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-flush-log-at-timeout') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-flush-log-at-trx-commit') do
        its(:value) { should eq 1 }
    end
    # Startup error
    #context mysql_config('innodb-flush-log-at-trx-commit-session') do
    #    its(:value) { should eq 3 }
    #end
    context mysql_config('innodb-flush-neighbors') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-flushing-avg-loops') do
        its(:value) { should eq 30 }
    end
    context mysql_config('innodb-force-load-corrupted') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-force-recovery') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-foreground-preflush') do
        its(:value) { should eq 'exponential_backoff' }
    end
    context mysql_config('innodb-ft-cache-size') do
        its(:value) { should eq 8000000 }
    end
    context mysql_config('innodb-ft-enable-diag-print') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-ft-enable-stopword') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-ft-max-token-size') do
        its(:value) { should eq 84 }
    end
    context mysql_config('innodb-ft-min-token-size') do
        its(:value) { should eq 3 }
    end
    context mysql_config('innodb-ft-num-word-optimize') do
        its(:value) { should eq 2000 }
    end
    context mysql_config('innodb-ft-server-stopword-table') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('innodb-ft-sort-pll-degree') do
        its(:value) { should eq 2 }
    end
    context mysql_config('innodb-ft-user-stopword-table') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('innodb-ft-result-cache-limit') do
        its(:value) { should eq 2000000000 }
    end
    context mysql_config('innodb-ft-total-cache-size') do
        its(:value) { should eq 640000000 }
    end
    # Startup error
    #context mysql_config('innodb-index-stats') do
    #    its(:value) { should eq 'TRUE' }
    #end
    context mysql_config('innodb-io-capacity') do
        its(:value) { should eq 200 }
    end
    context mysql_config('innodb-io-capacity-max') do
        its(:value) { should eq 200 }
    end
    context mysql_config('innodb-kill-idle-transaction') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-large-prefix') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-lock-wait-timeout') do
        its(:value) { should eq 50 }
    end
    context mysql_config('innodb-lock-waits') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-locking-fake-changes') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-locks') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-locks-unsafe-for-binlog') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-log-arch-dir') do
        its(:value) { should eq './' }
    end
    context mysql_config('innodb-log-arch-expire-sec') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-log-archive') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-log-block-size') do
        its(:value) { should eq 512 }
    end
    context mysql_config('innodb-log-buffer-size') do
        its(:value) { should eq 8388608 }
    end
    context mysql_config('innodb-log-checksum-algorithm') do
        its(:value) { should eq 'innodb' }
    end
    context mysql_config('innodb-log-compressed-pages') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-log-file-size') do
        its(:value) { should eq 5242880 }
    end
    context mysql_config('innodb-log-files-in-group') do
        its(:value) { should eq 2 }
    end
    context mysql_config('innodb-log-group-home-dir') do
        its(:value) { should eq '/var/lib/mysql/' }
    end
    context mysql_config('innodb-lru-scan-depth') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('innodb-max-bitmap-file-size') do
        its(:value) { should eq 104857600 }
    end
    context mysql_config('innodb-max-changed-pages') do
        its(:value) { should eq 1000000 }
    end
    context mysql_config('innodb-max-dirty-pages-pct') do
        its(:value) { should eq 75 }
    end
    context mysql_config('innodb-max-dirty-pages-pct-lwm') do
        its(:value) { should eq '0.001' }
    end
    context mysql_config('innodb-max-purge-lag-delay') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-max-purge-lag') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-old-blocks-pct') do
        its(:value) { should eq 37 }
    end
    context mysql_config('innodb-old-blocks-time') do
        its(:value) { should eq 1000 }
    end
    context mysql_config('innodb-online-alter-log-max-size') do
        its(:value) { should eq 134217728 }
    end
    context mysql_config('innodb-open-files') do
        its(:value) { should eq 300 }
    end
    context mysql_config('innodb-optimize-fulltext-only') do
        its(:value) { should eq 'FALSE' }
    end
    # Startup error
    #context mysql_config('innodb-overwrite-relay-log-info') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('innodb-page-size') do
        its(:value) { should eq 16384 }
    end
    context mysql_config('innodb-print-all-deadlocks') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-purge-batch-size') do
        its(:value) { should eq 300 }
    end
    context mysql_config('innodb-purge-threads') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-random-read-ahead') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-read-ahead-threshold') do
        its(:value) { should eq 56 }
    end
    context mysql_config('innodb-read-io-threads') do
        its(:value) { should eq 4 }
    end
    context mysql_config('innodb-read-only') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-replication-delay') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-rollback-on-timeout') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-rollback-segments') do
        its(:value) { should eq 128 }
    end
    # Startup error
    #context mysql_config('innodb-rseg') do
    #    its(:value) { should eq 'FALSE' }
    #end
    context mysql_config('innodb-sched-priority-cleaner') do
        its(:value) { should eq 19 }
    end
    context mysql_config('innodb-show-locks-held') do
        its(:value) { should eq 10 }
    end
    context mysql_config('innodb-show-verbose-locks') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-spin-wait-delay') do
        its(:value) { should eq 6 }
    end
    context mysql_config('innodb-sort-buffer-size') do
        its(:value) { should eq 1048576 }
    end
    context mysql_config('innodb-stats-auto-recalc') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-stats-method') do
        its(:value) { should eq 'nulls_equal' }
    end
    context mysql_config('innodb-stats-modified-counter') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-stats-on-metadata') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-stats-persistent') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-stats-persistent-sample-pages') do
        its(:value) { should eq 20 }
    end
    context mysql_config('innodb-stats-traditional') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-stats-transient-sample-pages') do
        its(:value) { should eq 8 }
    end
    context mysql_config('innodb-status-file') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-status-output') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-status-output-locks') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-strict-mode') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-support-xa') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-sync-array-size') do
        its(:value) { should eq 1 }
    end
    context mysql_config('innodb-sync-spin-loops') do
        its(:value) { should eq 30 }
    end
    context mysql_config('innodb-sys-indexes') do
        its(:value) { should eq 'ON' }
    end
    # Startup error
    #context mysql_config('innodb-sys-stats') do
    #    its(:value) { should eq 'TRUE' }
    #end
    #context mysql_config('innodb-table-stats') do
    #    its(:value) { should eq 'TRUE' }
    #end
    context mysql_config('innodb-sys-tables') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-table-locks') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-thread-concurrency') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-thread-sleep-delay') do
        its(:value) { should eq 10000 }
    end
    context mysql_config('innodb-track-changed-pages') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-trx') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('innodb-undo-directory') do
        its(:value) { should eq '.' }
    end
    context mysql_config('innodb-undo-logs') do
        its(:value) { should eq 128 }
    end
    context mysql_config('innodb-undo-tablespaces') do
        its(:value) { should eq 0 }
    end
    context mysql_config('innodb-use-atomic-writes') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-use-fallocate') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-use-global-flush-log-at-trx-commit') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-use-native-aio') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-use-stacktrace') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('innodb-use-sys-malloc') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('innodb-write-io-threads') do
        its(:value) { should eq 4 }
    end

    # Aria options
    #-------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#aria-options

    context mysql_config('aria-block-size') do
        its(:value) { should eq 8192 }
    end
    context mysql_config('aria-checkpoint-interval') do
        its(:value) { should eq 30 }
    end
    context mysql_config('aria-checkpoint-log-activity') do
        its(:value) { should eq 1048576 }
    end
    context mysql_config('aria-force-start-after-recovery-failures') do
        its(:value) { should eq 0 }
    end
    context mysql_config('aria-group-commit') do
        its(:value) { should eq 'none' }
    end
    context mysql_config('aria-group-commit-interval') do
        its(:value) { should eq 0 }
    end
    context mysql_config('aria-log-dir-path') do
        its(:value) { should eq '/var/lib/mysql/' }
    end
    context mysql_config('aria-log-file-size') do
        its(:value) { should eq 1073741824 }
    end
    context mysql_config('aria-log-purge-type') do
        its(:value) { should eq 'immediate' }
    end
    context mysql_config('aria-max-sort-file-size') do
        its(:value) { should eq 9223372036853727232 }
    end
    context mysql_config('aria-page-checksum') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('aria-pagecache-age-threshold') do
        its(:value) { should eq 300 }
    end
    context mysql_config('aria-pagecache-buffer-size') do
        its(:value) { should eq 134217728 }
    end
    context mysql_config('aria-pagecache-division-limit') do
        its(:value) { should eq 100 }
    end
    context mysql_config('aria-pagecache-file-hash-size') do
        its(:value) { should eq 512 }
    end
    context mysql_config('aria-recover') do
        its(:value) { should eq 'NORMAL' }
    end
    context mysql_config('aria-repair-threads') do
        its(:value) { should eq 1 }
    end
    context mysql_config('aria-sort-buffer-size') do
        its(:value) { should eq 268434432 }
    end
    context mysql_config('aria-stats-method') do
        its(:value) { should eq 'nulls_unequal' }
    end
    context mysql_config('aria-sync-log-dir') do
        its(:value) { should eq 'NEWFILE' }
    end
    context mysql_config('deadlock-search-depth-long') do
        its(:value) { should eq 15 }
    end
    context mysql_config('deadlock-search-depth-short') do
        its(:value) { should eq 4 }
    end
    context mysql_config('deadlock-timeout-long') do
        its(:value) { should eq 50000000 }
    end
    context mysql_config('deadlock-timeout-short') do
        its(:value) { should eq 10000 }
    end

    # Performance schema options
    #---------------------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#performance-schema-options

    context mysql_config('performance-schema') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('performance-schema-accounts-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-digests-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-stages-history-long-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-stages-history-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-statements-history-long-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-statements-history-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-waits-history-long-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-events-waits-history-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-hosts-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-cond-classes') do
        its(:value) { should eq 80 }
    end
    context mysql_config('performance-schema-max-cond-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-digest-length') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('performance-schema-max-file-classes') do
        its(:value) { should eq 50 }
    end
    context mysql_config('performance-schema-max-file-handles') do
        its(:value) { should eq 32768 }
    end
    context mysql_config('performance-schema-max-file-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-mutex-classes') do
        its(:value) { should eq 200 }
    end
    context mysql_config('performance-schema-max-mutex-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-rwlock-classes') do
        its(:value) { should eq 40 }
    end
    context mysql_config('performance-schema-max-rwlock-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-socket-classes') do
        its(:value) { should eq 10 }
    end
    context mysql_config('performance-schema-max-socket-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-stage-classes') do
        its(:value) { should eq 150 }
    end
    context mysql_config('performance-schema-max-statement-classes') do
        its(:value) { should eq 180 }
    end
    context mysql_config('performance-schema-max-table-handles') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-table-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-max-thread-classes') do
        its(:value) { should eq 50 }
    end
    context mysql_config('performance-schema-max-thread-instances') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-session-connect-attrs-size') do
        its(:value) { should eq '-1' }
    end
    context mysql_config('performance-schema-setup-actors-size') do
        its(:value) { should eq 100 }
    end
    context mysql_config('performance-schema-setup-objects-size') do
        its(:value) { should eq 100 }
    end
    context mysql_config('performance-schema-users-size') do
        its(:value) { should eq '-1' }
    end

    # Other options
    #--------------
    # https://mariadb.com/kb/en/mariadb/mysqld-options/#other-options

    context mysql_config('allow-suspicious-udfs') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('automatic-sp-privileges') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('back-log') do
        its(:value) { should eq 150 }
    end
    context mysql_config('basedir') do
        its(:value) { should eq '/usr' }
    end
    context mysql_config('bind-address') do
        its(:value) { should eq '127.0.0.1' }
    end
    context mysql_config('character-set-client-handshake') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('character-set-filesystem') do
        its(:value) { should eq 'binary' }
    end
    context mysql_config('character-set-server') do
        its(:value) { should eq 'latin1' }
    end
    context mysql_config('character-sets-dir') do
        its(:value) { should eq '/usr/share/mysql/charsets/' }
    end
    context mysql_config('collation-server') do
        its(:value) { should eq 'latin1_swedish_ci' }
    end
    context mysql_config('completion-type') do
        its(:value) { should eq 'NO_CHAIN' }
    end
    context mysql_config('connect-timeout') do
        its(:value) { should eq 10 }
    end
    context mysql_config('datadir') do
        its(:value) { should eq '/var/lib/mysql/' }
    end
    context mysql_config('debug') do
        its(:value) { should eq 'd:t:i:o,/tmp/mysqld.trace' }
    end
    context mysql_config('debug-no-thread-alarm') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('default-regex-flags') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('default-storage-engine') do
        its(:value) { should eq 'InnoDB' }
    end
    context mysql_config('default-time-zone') do
        its(:value) { should eq 'SYSTEM' }
    end
    context mysql_config('default-week-format') do
        its(:value) { should eq 0 }
    end
    context mysql_config('delay-key-write') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('div-precision-increment') do
        its(:value) { should eq 4 }
    end
    context mysql_config('event-scheduler') do
        its(:value) { should eq 'OFF' }
    end
    context mysql_config('extra-max-connections') do
        its(:value) { should eq 1 }
    end
    context mysql_config('extra-port') do
        its(:value) { should eq 0 }
    end
    context mysql_config('flush') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('flush-time') do
        its(:value) { should eq 0 }
    end
    context mysql_config('ft-boolean-syntax') do
        its(:value) { should eq '+ -><()~*:""&|' }
    end
    context mysql_config('ft-max-word-len') do
        its(:value) { should eq 84 }
    end
    context mysql_config('ft-min-word-len') do
        its(:value) { should eq 4 }
    end
    context mysql_config('ft-query-expansion-limit') do
        its(:value) { should eq 20 }
    end
    context mysql_config('general-log') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('general-log-file') do
        its(:value) { should eq '/var/log/mysql/mysql.log' }
    end
    context mysql_config('group-concat-max-len') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('histogram-size') do
        its(:value) { should eq 0 }
    end
    context mysql_config('histogram-type') do
        its(:value) { should eq 'SINGLE_PREC_HB' }
    end
    context mysql_config('host-cache-size') do
        its(:value) { should eq 128 }
    end
    context mysql_config('ignore-db-dirs') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('init-connect') do
        its(:value) { should eq ' ' }
    end
    context mysql_config('interactive-timeout') do
        its(:value) { should eq 28800 }
    end
    context mysql_config('large-pages') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('lc-messages') do
        its(:value) { should eq 'en_US' }
    end
    context mysql_config('lc-messages-dir') do
        its(:value) { should eq '/usr/share/mysql' }
    end
    context mysql_config('lc-time-names') do
        its(:value) { should eq 'en_US' }
    end
    context mysql_config('local-infile') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('lock-wait-timeout') do
        its(:value) { should eq 31536000 }
    end
    context mysql_config('log-error') do
        its(:value) { should eq '/var/log/mysql/error.log' }
    end
    context mysql_config('log-output') do
        its(:value) { should eq 'FILE' }
    end
    context mysql_config('log-queries-not-using-indexes') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('log-short-format') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('log-slow-admin-statements') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('log-slow-filter') do
        its(:value) { should eq 'admin,filesort,filesort_on_disk,full_join,full_scan,query_cache,query_cache_miss,tmp_table,tmp_table_on_disk' }
    end
    context mysql_config('log-slow-rate-limit') do
        its(:value) { should eq 1 }
    end
    context mysql_config('log-slow-slave-statements') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('log-slow-verbosity') do
        its(:value) { should eq 'query_plan' }
    end
    context mysql_config('log-tc') do
        its(:value) { should eq 'tc.log' }
    end
    context mysql_config('log-tc-size') do
        its(:value) { should eq 24576 }
    end
    context mysql_config('log-warnings') do
        its(:value) { should eq 1 }
    end
    context mysql_config('long-query-time') do
        its(:value) { should eq 10 }
    end
    context mysql_config('low-priority-updates') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('lower-case-table-names') do
        its(:value) { should eq 0 }
    end
    context mysql_config('memlock') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('max-allowed-packet') do
        its(:value) { should eq 1048576 }
    end
    context mysql_config('max-connect-errors') do
        its(:value) { should eq 100 }
    end
    context mysql_config('max-connections') do
        its(:value) { should eq 151 }
    end
    context mysql_config('max-delayed-threads') do
        its(:value) { should eq 20 }
    end
    context mysql_config('max-error-count') do
        its(:value) { should eq 64 }
    end
    context mysql_config('max-length-for-sort-data') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('max-prepared-stmt-count') do
        its(:value) { should eq 16382 }
    end
    context mysql_config('max-sp-recursion-depth') do
        its(:value) { should eq 0 }
    end
    context mysql_config('max-user-connections') do
        its(:value) { should eq 0 }
    end
    context mysql_config('max-write-lock-count') do
        its(:value) { should eq 4294967295 }
    end
    context mysql_config('metadata-locks-cache-size') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('metadata-locks-hash-instances') do
        its(:value) { should eq 8 }
    end
    context mysql_config('min-examined-row-limit') do
        its(:value) { should eq 0 }
    end
    context mysql_config('net-buffer-length') do
        its(:value) { should eq 16384 }
    end
    context mysql_config('net-read-timeout') do
        its(:value) { should eq 30 }
    end
    context mysql_config('net-retry-count') do
        its(:value) { should eq 10 }
    end
    context mysql_config('net-write-timeout') do
        its(:value) { should eq 60 }
    end
    context mysql_config('open-files-limit') do
        its(:value) { should eq 1024 }
    end
    context mysql_config('pid-file') do
        its(:value) { should eq '/var/run/mysqld/mysqld.pid' }
    end
    context mysql_config('plugin-dir') do
        its(:value) { should eq '/usr/lib/mysql/plugin/' }
    end
    context mysql_config('plugin-maturity') do
        its(:value) { should eq 'unknown' }
    end
    context mysql_config('port') do
        its(:value) { should eq 3306 }
    end
    context mysql_config('port-open-timeout') do
        its(:value) { should eq 0 }
    end
    context mysql_config('preload-buffer-size') do
        its(:value) { should eq 32768 }
    end
    context mysql_config('profiling-history-size') do
        its(:value) { should eq 15 }
    end
    context mysql_config('progress-report-time') do
        its(:value) { should eq 5 }
    end
    context mysql_config('query-cache-limit') do
        its(:value) { should eq 1048576 }
    end
    context mysql_config('query-cache-min-res-unit') do
        its(:value) { should eq 4096 }
    end
    context mysql_config('query-cache-size') do
        its(:value) { should eq 16777216 }
    end
    context mysql_config('query-cache-strip-comments') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('query-cache-type') do
        its(:value) { should eq 'ON' }
    end
    context mysql_config('query-cache-wlock-invalidate') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('read-only') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('read-rnd-buffer-size') do
        its(:value) { should eq 262144 }
    end
    context mysql_config('safe-user-create') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('secure-auth') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('show-slave-auth-info') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('slow-launch-time') do
        its(:value) { should eq 2 }
    end
    context mysql_config('slow-query-log') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('slow-query-log-file') do
        its(:value) { should eq '/var/log/mysql/mysql-slow.log' }
    end
    context mysql_config('socket') do
        its(:value) { should eq '/var/run/mysqld/mysqld.sock' }
    end
    context mysql_config('sort-buffer-size') do
        its(:value) { should eq 2097152 }
    end
    context mysql_config('ssl') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('stack-trace') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('stored-program-cache') do
        its(:value) { should eq 256 }
    end
    context mysql_config('symbolic-links') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('sync-frm') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('tc-heuristic-recover') do
        its(:value) { should eq 'COMMIT' }
    end
    context mysql_config('thread-cache-size') do
        its(:value) { should eq 0 }
    end
    context mysql_config('thread-concurrency') do
        its(:value) { should eq 10 }
    end
    context mysql_config('thread-handling') do
        its(:value) { should eq 'one-thread-per-connection' }
    end
    context mysql_config('thread-pool-idle-timeout') do
        its(:value) { should eq 60 }
    end
    context mysql_config('thread-pool-max-threads') do
        its(:value) { should eq 500 }
    end
    context mysql_config('thread-pool-oversubscribe') do
        its(:value) { should eq 3 }
    end
    context mysql_config('thread-pool-size') do
        its(:value) { should eq 1 }
    end
    context mysql_config('thread-pool-stall-limit') do
        its(:value) { should eq 500 }
    end
    context mysql_config('thread-stack') do
        its(:value) { should eq 294912 }
    end
    context mysql_config('tmpdir') do
        its(:value) { should eq '/tmp' }
    end
    context mysql_config('transaction-alloc-block-size') do
        its(:value) { should eq 8192 }
    end
    context mysql_config('transaction-prealloc-size') do
        its(:value) { should eq 4096 }
    end
    context mysql_config('transaction-isolation') do
        its(:value) { should eq 'REPEATABLE-READ' }
    end
    context mysql_config('transaction-read-only') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('updatable-views-with-limit') do
        its(:value) { should eq 'YES' }
    end
    context mysql_config('userstat') do
        its(:value) { should eq 'FALSE' }
    end
    context mysql_config('verbose') do
        its(:value) { should eq 'TRUE' }
    end
    context mysql_config('wait-timeout') do
        its(:value) { should eq 28800 }
    end

end

