redis-backup
============

a small ruby gem that allows automated redis RDB-file backups with support for compression and S3 uploading.

Installation
============

    gem install redis-backup

Usage
=====

    redis-backup [options]
    Specific options:
        -b, --backup-dir BACKUP_DIR      Directory to write backups to
        -c, --compress                   Compress backup as a zip file
        -s, --redis-source REDIS_SOURCE  Full path to redis dump.rdb file
        -m REDIS_SAVE_METHOD,            The method to call on redis for saving (save or bgsave or none)
            --redis-save-method
        -H, --redis-host REDIS_HOST      Host for local redis
        -p, --redis-port REDIS_PORT      Port for local redis
        -A S3_ACCESS_KEY_ID,             Your access_key_id for AWS S3
            --s3-access-key-id
        -B, --s3-bucket S3_BUCKET        Name of bucket to use on S3
        -C, --s3-clean                   Cleanup intermediate backup files
        -S S3_SECRET_ACCESS_KEY,         Your secret_access_key for AWS S3
            --s3-secret-access-key

    Common options:
        -h, --help                       Show this message
            --version                    Show version
